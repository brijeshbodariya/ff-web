import 'package:daily_diamond/app/constants/app_constant.dart';
import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/app/ui/app_image_assets.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/helper/custom_ad_helper.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      global: true,
      builder: (controller) {
        return PopScope(
          canPop: kIsWeb ? true : false,
          onPopInvoked: (didPop) {
            if (!kIsWeb) {
              goToExitPage();
            }
          },
          child: Scaffold(
            appBar: AppAppBar(isBackButtonShow: false),
            body: homeBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget homeBodyView() {
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
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToGetDailyDiamondPage()),
                child: const AppImageAsset(image: AppAssetsConstants.getDailyDiamondIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToRareEmotesPage()),
                child: const AppImageAsset(image: AppAssetsConstants.exclusiveEmotesIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToPetsPage()),
                child: const AppImageAsset(image: AppAssetsConstants.petsEnforcementIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToDiamondCalculatorPage()),
                child: const AppImageAsset(image: AppAssetsConstants.ffCalculatorIcon),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToMapPage()),
                child: const AppImageAsset(image: AppAssetsConstants.ffExclusiveMapsIcon),
              ),
            ],
          ),
        )
      ],
    );
  }
}
