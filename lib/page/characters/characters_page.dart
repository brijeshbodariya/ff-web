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
import '../info/info_page.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  List<Character> characters = [
    Character(
      name: "Hayato",
      imagePath: AppAssetsConstants.hayatoIcon,
      description: AppStringConstants.hayatoDes,
    ),
    Character(
      name: "Moco",
      imagePath: AppAssetsConstants.mocoIcon,
      description: AppStringConstants.moco,
    ),
    Character(
      name: "Wukong",
      imagePath: AppAssetsConstants.wukongIcon,
      description: AppStringConstants.wukong,
    ),
    Character(
      name: "Antonio",
      imagePath: AppAssetsConstants.antonioIcon,
      description: AppStringConstants.antonio,
    ),
    Character(
      name: "Andrew",
      imagePath: AppAssetsConstants.andrewIcon,
      description: AppStringConstants.andrew,
    ),
    Character(
      name: "Kelly",
      imagePath: AppAssetsConstants.kellyIcon,
      description: AppStringConstants.kelly,
    ),
    Character(
      name: "Olivia",
      imagePath: AppAssetsConstants.oliviaIcon,
      description: AppStringConstants.olivia,
    ),
    Character(
      name: "Ford",
      imagePath: AppAssetsConstants.fordIcon,
      description: AppStringConstants.ford,
    ),
    Character(
      name: "Nikita",
      imagePath: AppAssetsConstants.nikitaIcon,
      description: AppStringConstants.nikita,
    ),
    Character(
      name: "Misha",
      imagePath: AppAssetsConstants.mishaIcon,
      description: AppStringConstants.misha,
    ),
    Character(
      name: "Maxim",
      imagePath: AppAssetsConstants.maximIcon,
      description: AppStringConstants.maxim,
    ),
    Character(
      name: "Kla",
      imagePath: AppAssetsConstants.klaIcon,
      description: AppStringConstants.kla,
    ),
    Character(
      name: "Paloma",
      imagePath: AppAssetsConstants.palomaIcon,
      description: AppStringConstants.paloma,
    ),
    Character(
      name: "Miguel",
      imagePath: AppAssetsConstants.miguelIcon,
      description: AppStringConstants.miguel,
    ),
    Character(
      name: "Caroline",
      imagePath: AppAssetsConstants.carolineIcon,
      description: AppStringConstants.caroline,
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
            appBar: AppAppBar(title: AppStringConstants.sportCharacters),
            body: charactersBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget charactersBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: List.generate(
              characters.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      saveData(infoTitle, characters[index].name);
                      saveData(infoContent, characters[index].description);
                      await CustomAdHelper.interstitialAd(callback: () => goToInfoPage());
                    },
                    child: AppImageAsset(image: characters[index].imagePath),
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

class Character {
  final String name;
  final String imagePath;
  final String description;

  Character({required this.name, required this.imagePath, required this.description});
}
