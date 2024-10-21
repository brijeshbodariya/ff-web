import 'package:daily_diamond/app/constants/app_constant.dart';
import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';
import '../select_id_level/select_id_level_page.dart';

class SelectPlayerCategoryPage extends StatefulWidget {
  const SelectPlayerCategoryPage({super.key});

  @override
  State<SelectPlayerCategoryPage> createState() => _SelectPlayerCategoryPageState();
}

class _SelectPlayerCategoryPageState extends State<SelectPlayerCategoryPage> {
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
            appBar: AppAppBar(title: AppStringConstants.selectPlayerCategory),
            body: selectPlayerCategoryBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget selectPlayerCategoryBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: isPets
              ? Column(
                  children: [
                    buttonView(imagePath: AppAssetsConstants.causalPlayerIcon),
                    const SizedBox(height: 10),
                    buttonView(imagePath: AppAssetsConstants.mixPlayerIcon),
                    const SizedBox(height: 10),
                    buttonView(imagePath: AppAssetsConstants.excPlayerIcon),
                    const SizedBox(height: 10),
                    buttonView(imagePath: AppAssetsConstants.proPlayerIcon),
                  ],
                )
              : Column(
                  children: [
                    buttonView(imagePath: AppAssetsConstants.proPlayerIcon),
                    const SizedBox(height: 10),
                    buttonView(imagePath: AppAssetsConstants.mixPlayerIcon),
                    const SizedBox(height: 10),
                    buttonView(imagePath: AppAssetsConstants.causalPlayerIcon),
                  ],
                ),
        )
      ],
    );
  }

  Widget buttonView({required String imagePath}) {
    return GestureDetector(
      onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToSelectIdLevelPage()),
      child: AppImageAsset(image: imagePath),
    );
  }
}
