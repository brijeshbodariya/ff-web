import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_custom_banner_ads.dart';
import '../../app/ui/app_custom_native_ads.dart';
import '../../app/ui/app_image_assets.dart';
import '../../app/ui/app_text.dart';
import '../../controller/splash_controller.dart';
import '../../routes/app_routes.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({super.key});

  @override
  State<ExitPage> createState() => _ExitPageState();
}

class _ExitPageState extends State<ExitPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            body: exitBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget exitBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const AppCustomNativeAds(),
        SizedBox(height: CustomAdHelper.isNativeAdShow ? 15 : MediaQuery.of(context).size.height * 0.3),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10).copyWith(bottom: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                text: "Exit",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const AppText(
                text: "Are you sure you want to exit?",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToBack()),
                      child: const AppImageAsset(
                        image: AppAssetsConstants.noIcon,
                        height: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => exit(0),
                      child: const AppImageAsset(
                        image: AppAssetsConstants.yesIcon,
                        height: 50,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
