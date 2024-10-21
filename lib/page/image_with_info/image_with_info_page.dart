import 'package:daily_diamond/app/constants/app_constant.dart';
import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_custom_native_small_ads.dart';
import '../../app/ui/app_image_assets.dart';
import '../../app/ui/app_text.dart';
import '../../routes/app_routes.dart';

String imgWithInfoTitle = "imgWithInfoTitle";
String imgWithInfoContent = "imgWithInfoContent";
String imgWithInfoImgPath = "imgWithInfoImgPath";

class ImageWithInfoPage extends StatefulWidget {
  const ImageWithInfoPage({super.key});

  @override
  State<ImageWithInfoPage> createState() => _ImageWithInfoPageState();
}

class _ImageWithInfoPageState extends State<ImageWithInfoPage> {
  String appBarTitle = "";
  String description = "";
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (state) {
        appBarTitle = loadData(imgWithInfoTitle) ?? AppStringConstants.fffDiamond;
        description = loadData(imgWithInfoContent) ?? '';
        imagePath = loadData(imgWithInfoImgPath) ?? '';
      },
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: appBarTitle),
            body: imageWithInfoBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget imageWithInfoBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AppImageAsset(image: imagePath, height: 180),
              AppText(
                text: description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        title: const Center(
                          child: AppText(
                            text: "Congratulations",
                            textAlign: TextAlign.center,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(
                              text: "Your Item may be added to your collection within in 48 hours.",
                              textAlign: TextAlign.center,
                            ),
                            AppCustomNativeSmallAds()
                          ],
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.pop(context);
                              await CustomAdHelper.interstitialAd(callback: () => goToHomePage());
                            },
                            child: const Center(
                              child: AppImageAsset(image: AppAssetsConstants.okIcon, height: 50),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const AppImageAsset(
                  image: AppAssetsConstants.activeNowIcon,
                  height: 45,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
