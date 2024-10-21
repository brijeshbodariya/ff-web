import 'package:daily_diamond/app/ui/app_custom_banner_ads.dart';
import 'package:daily_diamond/app/ui/app_custom_native_ads.dart';
import 'package:daily_diamond/app/ui/app_text.dart';
import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/ui/app_app_bar.dart';
import '../../routes/app_routes.dart';

String infoTitle = "infoTitle";
String infoContent = "infoContent";

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String appBarTitle = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (state) {
        appBarTitle = loadData(infoTitle) ?? AppStringConstants.fffDiamond;
        description = loadData(infoContent) ?? '';
      },
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: appBarTitle),
            body: infoBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget infoBodyView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const AppCustomNativeAds(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AppText(text: description),
            ],
          ),
        )
      ],
    );
  }
}
