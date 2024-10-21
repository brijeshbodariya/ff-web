import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:daily_diamond/page/image_with_info/image_with_info_page.dart';
import 'package:daily_diamond/page/rare_emotes/rare_emotes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';
import '../select_id_level/select_id_level_page.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  List<EmotesModel> petsList = [
    EmotesModel(
      name: "FF Derki",
      imagePath: AppAssetsConstants.ffDerkiIcon,
      description: AppStringConstants.derki,
      infoImagePath: AppAssetsConstants.infoFFDerkiIcon,
    ),
    EmotesModel(
      name: "FF Yeti",
      imagePath: AppAssetsConstants.ffYetiIcon,
      description: AppStringConstants.yeti,
      infoImagePath: AppAssetsConstants.infoFFYeti,
    ),
    EmotesModel(
      name: "FF Moony",
      imagePath: AppAssetsConstants.ffMoonyIcon,
      description: AppStringConstants.moony,
      infoImagePath: AppAssetsConstants.infoFFMoonyIcon,
    ),
    EmotesModel(
      name: "FF Ottero",
      imagePath: AppAssetsConstants.ffOtteroIcon,
      description: AppStringConstants.ottero,
      infoImagePath: AppAssetsConstants.infoFFOtteroIcon,
    ),
    EmotesModel(
      name: "FF Panda",
      imagePath: AppAssetsConstants.ffPandaIcon,
      description: AppStringConstants.panda,
      infoImagePath: AppAssetsConstants.infoFFPandaIcon,
    ),
    EmotesModel(
      name: "FF Robo",
      imagePath: AppAssetsConstants.ffRoboIcon,
      description: AppStringConstants.robo,
      infoImagePath: AppAssetsConstants.infoFFRobo,
    ),
    EmotesModel(
      name: "FF Flash",
      imagePath: AppAssetsConstants.ffFlashIcon,
      description: AppStringConstants.flash,
      infoImagePath: AppAssetsConstants.infoFFFlashIcon,
    ),
    EmotesModel(
      name: "FF Shiba",
      imagePath: AppAssetsConstants.ffShibaIcon,
      description: AppStringConstants.shiba,
      infoImagePath: AppAssetsConstants.infoFFShiba,
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
            appBar: AppAppBar(title: AppStringConstants.pets),
            body: petsPageBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget petsPageBodyView() {
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
            petsList.length,
            (index) {
              return GestureDetector(
                onTap: () async {
                  saveData(imgWithInfoTitle, petsList[index].name);
                  saveData(imgWithInfoContent, petsList[index].description);
                  saveData(imgWithInfoImgPath, petsList[index].infoImagePath);
                  await CustomAdHelper.interstitialAd(callback: () {
                    saveData(selectIdLevelIsPets, "1");
                    goToSelectPlayerCategoryPage();
                  });
                },
                child: AppImageAsset(
                  image: petsList[index].imagePath,
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
