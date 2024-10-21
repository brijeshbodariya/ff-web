import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/app/ui/app_image_assets.dart';
import 'package:daily_diamond/app/ui/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../controller/splash_controller.dart';
import '../../routes/app_routes.dart';

class LetsStartedPage extends StatefulWidget {
  const LetsStartedPage({super.key});

  @override
  State<LetsStartedPage> createState() => _LetsStartedPageState();
}

class _LetsStartedPageState extends State<LetsStartedPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      global: true,
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            goToExitPage();
          },
          child: Scaffold(
            appBar: AppAppBar(isBackButtonShow: false),
            body: letsStartedBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget letsStartedBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: AppStringConstants.letsStarted.tr,
                fontSize: 12,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToHomePage()),
                child: const AppImageAsset(image: AppAssetsConstants.letsStartedIcon),
              ),
              const SizedBox(height: 10),
              stepView(
                title: "STEP 1 :",
                content:
                    "Select from the options on home screen what category of items you want forexample : Select SUPER RARE",
              ),
              const SizedBox(height: 10),
              stepView(
                title: "STEP 2 :",
                content:
                    "Select from the Items List and click on the item you want to get for Example : Select I am Rich.",
              ),
              const SizedBox(height: 10),
              stepView(
                title: "STEP 3 :",
                content:
                    "Click on the GET EMOTE button on the Screen to get your favourite item. Now, You are ready to Rock. Open FF and you will have got your Item!.",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget stepView({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        AppText(
          text: content,
          fontSize: 12,
        ),
      ],
    );
  }
}
