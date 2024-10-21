import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:daily_diamond/page/info/info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';

class GetDailyDiamondPage extends StatefulWidget {
  const GetDailyDiamondPage({super.key});

  @override
  State<GetDailyDiamondPage> createState() => _GetDailyDiamondPageState();
}

class _GetDailyDiamondPageState extends State<GetDailyDiamondPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(),
            body: getDailyDiamondBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget getDailyDiamondBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  saveData(infoTitle, "Get Daily Diamond");
                  saveData(infoContent, AppStringConstants.ffDiamondDescription);
                  await CustomAdHelper.interstitialAd(callback: () => goToInfoPage());
                },
                child: const AppImageAsset(image: AppAssetsConstants.ffDailyDiamondIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToCharactersPage()),
                child: const AppImageAsset(image: AppAssetsConstants.ffCharacterIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  saveData(infoTitle, "Tips And Tricks");
                  saveData(infoContent, AppStringConstants.ffTipsAndTricksDescription);

                  await CustomAdHelper.interstitialAd(callback: () => goToInfoPage());
                },
                child: const AppImageAsset(image: AppAssetsConstants.ffTipsTricksIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToVehiclePage()),
                child: const AppImageAsset(image: AppAssetsConstants.ffVehiclesIcon),
              ),
              // SizedBox(height: 10),
              // AppImageAsset(image: AppAssetsConstants.ffWeaponsIcon),
            ],
          ),
        )
      ],
    );
  }
}
