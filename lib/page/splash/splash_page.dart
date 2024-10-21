import 'package:daily_diamond/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/connectivity_helper.dart';
import '../../app/ui/app_image_assets.dart';
import '../../routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController splashController;

  Future<void> init() async {
    bool connected = await ConnectivityService.instance.isCheckConnectivity(isSplash: true);
    if (connected) {
      Future.delayed(const Duration(milliseconds: 10), () => getAdsResponse());
      Future.delayed(const Duration(seconds: 2), () => goToLetsStartedPage());
    }
  }

  Future<void> getAdsResponse() async {
    await splashController.getAdsResponse();
    splashController.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      global: true,
      initState: (state) => init(),
      builder: (controller) {
        splashController = controller;
        return Scaffold(
          body: splashBodyView(),
        );
      },
    );
  }

  Widget splashBodyView() {
    return Stack(
      children: [
        const AppImageAsset(
          image: AppAssetsConstants.splashBackground,
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        const Center(
          child: AppImageAsset(
            image: AppAssetsConstants.splashIcon,
            fit: BoxFit.fill,
            height: 170,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(18),
              color: AppColorConstants.appWhite,
              backgroundColor: AppColorConstants.appWhite.withOpacity(0.3),
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ),
      ],
    );
  }
}
