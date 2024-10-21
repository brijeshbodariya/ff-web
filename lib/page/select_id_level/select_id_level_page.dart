import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';

String selectIdLevelIsPets = "isPets";

class SelectIdLevelPage extends StatefulWidget {
  const SelectIdLevelPage({super.key});

  @override
  State<SelectIdLevelPage> createState() => _SelectIdLevelPageState();
}

class _SelectIdLevelPageState extends State<SelectIdLevelPage> {
  bool isPets = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (state) {
        isPets = CustomAdHelper.intToBool(int.parse(loadData(selectIdLevelIsPets).toString()));
      },
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: AppStringConstants.selectIdLevel),
            body: selectIdLevelBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget selectIdLevelBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              buttonView(imagePath: AppAssetsConstants.icon025),
              const SizedBox(height: 10),
              buttonView(imagePath: AppAssetsConstants.icon2640),
              const SizedBox(height: 10),
              buttonView(imagePath: AppAssetsConstants.icon4150),
              const SizedBox(height: 10),
              buttonView(imagePath: AppAssetsConstants.icon5160),
              const SizedBox(height: 10),
              buttonView(imagePath: AppAssetsConstants.icon6170),
              const SizedBox(height: 10),
              if (!isPets) buttonView(imagePath: AppAssetsConstants.icon80),
            ],
          ),
        )
      ],
    );
  }

  Widget buttonView({required String imagePath}) {
    return GestureDetector(
      onTap: () async =>
          await CustomAdHelper.interstitialAd(callback: () => isPets ? goToSelectRankPage() : goToImageWithInfoPage()),
      child: AppImageAsset(image: imagePath),
    );
  }
}
