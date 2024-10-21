import 'package:daily_diamond/app/constants/app_constant.dart';
import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:daily_diamond/page/rare_emotes/rare_emotes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';
import 'map_details_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<EmotesModel> mapList = [
    EmotesModel(
      name: "Santa Catarina",
      imagePath: AppAssetsConstants.santaCatarinaIcon,
      description: AppStringConstants.santaCatarina,
      infoImagePath: AppAssetsConstants.infoSantaCatarinaIcon,
    ),
    EmotesModel(
      name: "Bayfront",
      imagePath: AppAssetsConstants.bayfrontIcon,
      description: AppStringConstants.bayfront,
      infoImagePath: AppAssetsConstants.infoBayfrontIcon,
    ),
    EmotesModel(
      name: "Council Hall",
      imagePath: AppAssetsConstants.councilHallIcon,
      description: AppStringConstants.councilHall,
      infoImagePath: AppAssetsConstants.infoCouncilHallIcon,
    ),
    EmotesModel(
      name: "Hampton",
      imagePath: AppAssetsConstants.hamptonIcon,
      description: AppStringConstants.hampton,
      infoImagePath: AppAssetsConstants.infoHamptonIcon,
    ),
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
            appBar: AppAppBar(title: AppStringConstants.map),
            body: mapBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget mapBodyView() {
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
            mapList.length,
            (index) {
              return GestureDetector(
                onTap: () async {
                  await CustomAdHelper.interstitialAd(
                    callback: () {
                      saveData(mapDetailsTitle, mapList[index].name);
                      saveData(mapDetailsDescription, mapList[index].description);
                      saveData(mapDetailsImgPath, mapList[index].infoImagePath);
                      goToMapDetailsPage();
                    },
                  );
                },
                child: AppImageAsset(
                  image: mapList[index].imagePath,
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
