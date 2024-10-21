import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constant.dart';
import '../../app/helper/app_helper.dart';
import '../../app/helper/custom_ad_helper.dart';
import '../../app/ui/app_app_bar.dart';
import '../../app/ui/app_custom_banner_ads.dart';
import '../../app/ui/app_custom_native_ads.dart';
import '../../app/ui/app_custom_native_small_ads.dart';
import '../../app/ui/app_image_assets.dart';
import '../../app/ui/app_text.dart';
import '../../controller/splash_controller.dart';
import '../../routes/app_routes.dart';

String diamondCountTitle = "diamondCountTitle";

class DiamondCountPage extends StatefulWidget {
  const DiamondCountPage({super.key});

  @override
  State<DiamondCountPage> createState() => _DiamondCountPageState();
}

class _DiamondCountPageState extends State<DiamondCountPage> {
  String appBarTitle = '';
  TextEditingController diamondCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (state) {
        appBarTitle = loadData(diamondCountTitle) ?? AppStringConstants.fffDiamond;
      },
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: backButtonAction,
          child: Scaffold(
            appBar: AppAppBar(title: appBarTitle),
            body: diamondCountBodyView(),
            bottomNavigationBar: const AppCustomBannerAds(),
          ),
        );
      },
    );
  }

  Widget diamondCountBodyView() {
    return ListView(
      children: [
        const AppCustomNativeAds(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: CustomAdHelper.isNativeAdShow ? 20 : MediaQuery.of(context).size.height * 0.3),
              TextField(
                controller: diamondCountController,
                decoration: const InputDecoration(
                  hintText: 'Enter Number of Diamond',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  if (diamondCountController.text.isNotEmpty) {
                    double diamondCount = double.parse(diamondCountController.text);
                    double diamondCountInUsd = calculateCost(diamondCount);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 15),
                          titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                          title: const AppText(
                            text: "Daily Diamonds",
                            fontWeight: FontWeight.w600,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                text:
                                    "Buying $diamondCount diamond(s) will cost you $diamondCountInUsd USD per day. Do you want to continue?",
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                              const AppCustomNativeSmallAds(),
                            ],
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToBack()),
                              child: const Center(
                                child: AppImageAsset(
                                  image: AppAssetsConstants.okIcon,
                                  height: 45,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AppText(text: 'Please enter diamond count'),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: AppImageAsset(
                  image: AppAssetsConstants.calculatorNowIcon,
                  height: 55,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  double calculateCost(double diamonds) {
    // Example cost: 1 diamond = 1.5 currency units
    double costPerDiamond = 25;
    return diamonds * costPerDiamond;
  }
}
