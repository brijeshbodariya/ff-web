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

class SelectRankPage extends StatefulWidget {
  const SelectRankPage({super.key});

  @override
  State<SelectRankPage> createState() => _SelectRankPageState();
}

class _SelectRankPageState extends State<SelectRankPage> {
  List<String> selectRankList = [
    AppAssetsConstants.icon1,
    AppAssetsConstants.icon2,
    AppAssetsConstants.icon3,
    AppAssetsConstants.icon4,
    AppAssetsConstants.icon5,
    AppAssetsConstants.icon6,
    AppAssetsConstants.icon7,
    AppAssetsConstants.icon8,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: AppStringConstants.selectRank),
            body: selectRankBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget selectRankBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        GridView.count(
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
          children: List.generate(
            selectRankList.length,
            (index) {
              return GestureDetector(
                onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToImageWithInfoPage()),
                child: AppImageAsset(
                  image: selectRankList[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
