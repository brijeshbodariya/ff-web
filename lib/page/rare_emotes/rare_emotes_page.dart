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
import '../image_with_info/image_with_info_page.dart';
import '../select_id_level/select_id_level_page.dart';

class RareEmotesPage extends StatefulWidget {
  const RareEmotesPage({super.key});

  @override
  State<RareEmotesPage> createState() => _RareEmotesPageState();
}

class _RareEmotesPageState extends State<RareEmotesPage> {
  List<EmotesModel> emotesList = [
    EmotesModel(
      name: "Take Cover",
      imagePath: AppAssetsConstants.takeCoverIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoTakeCoverIcon,
    ),
    EmotesModel(
      name: "Make It Rain",
      imagePath: AppAssetsConstants.makeItRainIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoMakeItRainIcon,
    ),
    EmotesModel(
      name: "Pushup",
      imagePath: AppAssetsConstants.pushupIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoPushupIcon,
    ),
    EmotesModel(
      name: "One Finger",
      imagePath: AppAssetsConstants.oneFingerIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoOneFingerIcon,
    ),
    EmotesModel(
      name: "Pro Football",
      imagePath: AppAssetsConstants.proFootballIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoProFootballIcon,
    ),
    EmotesModel(
      name: "Bhangra",
      imagePath: AppAssetsConstants.bhangraIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoBhangraIcon,
    ),
    EmotesModel(
      name: "Threaten",
      imagePath: AppAssetsConstants.threatenIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoThreatenIcon,
    ),
    EmotesModel(
      name: "Eat My Dust",
      imagePath: AppAssetsConstants.eatMyDustIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoEatMyDustIcon,
    ),
    EmotesModel(
      name: "Provoke",
      imagePath: AppAssetsConstants.provokeIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoProvokeIcon,
    ),
    EmotesModel(
      name: "FFWC Throne",
      imagePath: AppAssetsConstants.ffwcThroneIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoFFWCThrone,
    ),
    EmotesModel(
      name: "Baby Shark",
      imagePath: AppAssetsConstants.babySharkIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoBabySharkIcon,
    ),
    EmotesModel(
      name: "Celebrate",
      imagePath: AppAssetsConstants.celebrateIcon,
      description: "",
      infoImagePath: AppAssetsConstants.infoCelebrateIcon,
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
            appBar: AppAppBar(title: AppStringConstants.rareEmotes),
            body: rareEmotesBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget rareEmotesBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: List.generate(
              emotesList.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      saveData(imgWithInfoTitle, emotesList[index].name);
                      saveData(imgWithInfoContent, emotesList[index].description);
                      saveData(imgWithInfoImgPath, emotesList[index].infoImagePath);
                      await CustomAdHelper.interstitialAd(callback: () {
                        saveData(selectIdLevelIsPets, "0");
                        goToSelectPlayerCategoryPage();
                      });
                    },
                    child: AppImageAsset(image: emotesList[index].imagePath),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class EmotesModel {
  final String name;
  final String imagePath;
  final String description;
  final String infoImagePath;

  EmotesModel({required this.name, required this.imagePath, required this.description, required this.infoImagePath});
}
