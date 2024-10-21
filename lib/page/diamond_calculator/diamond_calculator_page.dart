import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/app/ui/app_image_assets.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../routes/app_routes.dart';
import '../diamond_count/diamond_count_page.dart';

class DiamondCalculatorPage extends StatefulWidget {
  const DiamondCalculatorPage({super.key});

  @override
  State<DiamondCalculatorPage> createState() => _DiamondCalculatorPageState();
}

class _DiamondCalculatorPageState extends State<DiamondCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: AppStringConstants.diamondCalculator),
            body: diamondCalculatorBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget diamondCalculatorBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              buttonView(
                imagePath: AppAssetsConstants.basicCalculatorIcon,
                title: AppStringConstants.basicCalculator,
              ),
              const SizedBox(height: 10),
              buttonView(
                imagePath: AppAssetsConstants.normalCalculatorIcon,
                title: AppStringConstants.normalCalculator,
              ),
              const SizedBox(height: 10),
              buttonView(
                imagePath: AppAssetsConstants.advanceCalculatorIcon,
                title: AppStringConstants.advancedCalculator,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buttonView({required String imagePath, required String title}) {
    return GestureDetector(
      onTap: () async => await CustomAdHelper.interstitialAd(callback: () {
        saveData(diamondCountTitle, title);
        goToDiamondCountPage();
      }),
      child: AppImageAsset(image: imagePath),
    );
  }
}
