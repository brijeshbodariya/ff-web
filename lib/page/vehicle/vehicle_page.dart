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
import '../characters/characters_page.dart';
import '../info/info_page.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  List<Character> vehicles = [
    Character(
      name: "Sport Car",
      imagePath: AppAssetsConstants.sportCarIcon,
      description: AppStringConstants.sportsCar,
    ),
    Character(
      name: "Monster Car",
      imagePath: AppAssetsConstants.monsterCarIcon,
      description: AppStringConstants.motorCar,
    ),
    Character(
      name: "Motorcycle",
      imagePath: AppAssetsConstants.motorCycleIcon,
      description: AppStringConstants.motorCrycle,
    ),
    Character(
      name: "Amphibian",
      imagePath: AppAssetsConstants.amphibianIcon,
      description: AppStringConstants.amphibian,
    ),
    Character(
      name: "Military Jeep",
      imagePath: AppAssetsConstants.militaryJeepIcon,
      description: AppStringConstants.militaryJeep,
    ),
    Character(
      name: "Tuk Tuk",
      imagePath: AppAssetsConstants.tukTukIcon,
      description: AppStringConstants.tukTuk,
    ),
    Character(
      name: "Van",
      imagePath: AppAssetsConstants.vanIcon,
      description: AppStringConstants.van,
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
            appBar: AppAppBar(title: AppStringConstants.vehicles),
            body: vehicleBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget vehicleBodyView() {
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
            vehicles.length,
            (index) {
              return GestureDetector(
                onTap: () async {
                  saveData(infoTitle, vehicles[index].name);
                  saveData(infoContent, vehicles[index].description);
                  await CustomAdHelper.interstitialAd(callback: () => goToInfoPage());
                },
                child: AppImageAsset(
                  image: vehicles[index].imagePath,
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
