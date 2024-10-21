import 'package:daily_diamond/app/ui/app_app_bar.dart';
import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/app/ui/app_image_assets.dart';
import 'package:daily_diamond/app/ui/app_text.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:daily_diamond/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/helper/app_helper.dart';

String mapDetailsTitle = "mapDetailsTitle";
String mapDetailsDescription = "mapDetailsDescription";
String mapDetailsImgPath = "mapDetailsImgPath";

class MapDetailsPage extends StatefulWidget {
  const MapDetailsPage({super.key});

  @override
  State<MapDetailsPage> createState() => _MapDetailsPageState();
}

class _MapDetailsPageState extends State<MapDetailsPage> {
  String title = "";
  String description = "";
  String imgPath = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (state) {
        title = loadData(mapDetailsTitle) ?? '';
        description = loadData(mapDetailsDescription) ?? '';
        imgPath = loadData(mapDetailsImgPath) ?? '';
      },
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: title),
            body: mapDetailsBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget mapDetailsBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AppImageAsset(image: imgPath),
              const SizedBox(height: 20),
              AppText(
                text: description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
