import 'package:daily_diamond/model/app_ads_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:html' as html;
import 'package:get/get.dart';

class CustomAdHelper {
  static int userInAdClick = 0;
  static int userOutAdClick = 0;

  static int userInAdClickCount = 0;
  static int userOutAdClickCount = 0;

  static bool isNativeAdShow = true;
  static bool isNativeSmallAdShow = true;
  static bool isBannerAdShow = true;
  static bool isInterAdShow = true;
  static bool isBackButtonAdShow = false;

  static String isNativeAdUrl = 'https://tush3.quiztwiz.com/';
  static String isNativeSmallAdUrl = 'https://tush3.quiztwiz.com/';
  static String isBannerAdUrl = 'https://tush3.quiztwiz.com/';
  static String isInterAdUrl = 'https://tush3.quiztwiz.com/';

  static String appNativeAdTitle = 'Play Quiz';
  static String appNativeAdDescription = 'Get the unique diamond skin';
  static String appNativeAdButtonTitle = 'Play Now';

  static List<String> nativeAdImageList = [
    "https://cyberappss.com/link/QurekaAsset/n1.png",
    "https://cyberappss.com/link/QurekaAsset/n2.png",
    "https://cyberappss.com/link/QurekaAsset/n3.png",
    "https://cyberappss.com/link/QurekaAsset/n4.png",
    "https://cyberappss.com/link/QurekaAsset/n5.png"
  ];
  static List<String> bannerAdImageList = [
    "https://divineinfotech.website/ASSET/b1.png",
    "https://divineinfotech.website/ASSET/b2.png",
    "https://divineinfotech.website/ASSET/b3.png",
    "https://divineinfotech.website/ASSET/b4.png",
    "https://divineinfotech.website/ASSET/b5.png"
  ];
  static List<String> nativeSmallAdImageList = [
    "https://cyberappss.com/link/QurekaAsset/n1.png",
    "https://cyberappss.com/link/QurekaAsset/n2.png",
    "https://cyberappss.com/link/QurekaAsset/n3.png",
    "https://cyberappss.com/link/QurekaAsset/n4.png",
    "https://cyberappss.com/link/QurekaAsset/n5.png"
  ];
  static List<String> nativeGifList = ["https://cyberappss.com/link/QurekaAsset/g1.gif"];

  static bool intToBool(int num) => num == 1 ? true : false;

  static void setAdsResponse({required AppAdsModel appAdsModel}) {
    userInAdClick = appAdsModel.userInAdClick ?? 0;
    userOutAdClick = appAdsModel.userOutAdClick ?? 0;
    appNativeAdTitle = appAdsModel.title ?? '';
    appNativeAdDescription = appAdsModel.description ?? '';
    appNativeAdButtonTitle = appAdsModel.buttonTitle ?? '';

    isNativeAdShow = intToBool(appAdsModel.isNativeAdShow ?? 0);
    isNativeSmallAdShow = intToBool(appAdsModel.isNativeSmallAdShow ?? 0);
    isBannerAdShow = intToBool(appAdsModel.isBannerAdShow ?? 0);
    isInterAdShow = intToBool(appAdsModel.isInterAdShow ?? 0);
    isBackButtonAdShow = intToBool(appAdsModel.isBackButtonAdShow ?? 0);
    isNativeAdUrl = appAdsModel.isNativeAdUrl ?? '';
    isNativeSmallAdUrl = appAdsModel.isNativeSmallAdUrl ?? '';
    isBannerAdUrl = appAdsModel.isBannerAdUrl ?? '';
    isInterAdUrl = appAdsModel.isInterAdUrl ?? '';
    if (appAdsModel.isAllAppAdsShow == 0) {
      isNativeAdShow = false;
      isNativeSmallAdShow = false;
      isBannerAdShow = false;
      isInterAdShow = false;
      isBackButtonAdShow = false;
    }

    // set image
    nativeAdImageList = appAdsModel.nativeAdImageList ?? [];
    bannerAdImageList = appAdsModel.bannerAdImageList ?? [];
    nativeSmallAdImageList = appAdsModel.nativeSmallAdImageList ?? [];
    nativeGifList = appAdsModel.nativeGifIconList ?? [];
  }

  static Future<void> interstitialAd({required Function callback, bool isBackButton = false}) async {
    if (kIsWeb) {
      print("Web");
      callback();
      if (!isBackButton) {
        Future.delayed(const Duration(milliseconds: 200), () => html.window.open(isInterAdUrl, '_self'));
      }

      // if (!isBackButton) {
      //   print("isBackButton $isBackButton");
      //   if (await urlLauncher.canLaunchUrl(Uri.parse("https://tush3.quiztwiz.com/"))) {
      //     print("canLaunchUrl true");
      //     await urlLauncher.launchUrl(Uri.parse("https://tush3.quiztwiz.com/"), webOnlyWindowName: '_self').then(
      //       (value) {
      //         if (callback != null) {
      //           // callback();
      //           // Future.delayed(const Duration(seconds: 1), () => callback());
      //         }
      //       },
      //     );
      //   } else {
      //     await launchURLInDefaultBrowserOnAndroid(Get.context!,
      //         callback: callback, url: "https://tush3.quiztwiz.com/");
      //   }
      // } else {
      //   print("isBackButton $isBackButton");
      //   callback();
      // }
    } else {
      if (isInterAdShow) {
        if (isBackButton) {
          userOutAdClickCount++;
          if (userOutAdClickCount == userOutAdClick) {
            userOutAdClickCount = 0;
            await launchURLInDefaultBrowserOnAndroid(Get.context!, callback: callback, url: isInterAdUrl);
          } else {
            callback();
          }
        } else {
          userInAdClickCount++;
          if (userInAdClickCount == userInAdClick) {
            userInAdClickCount = 0;
            await launchURLInDefaultBrowserOnAndroid(Get.context!, callback: callback, url: isInterAdUrl);
          } else {
            callback();
          }
        }
      } else {
        callback();
      }
    }
  }

  static Future<void> launchURLInDefaultBrowserOnAndroid(BuildContext context,
      {Function? callback, required String? url}) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(url ?? ''),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.surface,
          ),
          // urlBarHidingEnabled: true,
          // showTitle: true,
          instantAppsEnabled: true,
          browser: const CustomTabsBrowserConfiguration(prefersDefaultBrowser: true),
        ),
      ).whenComplete(
        () {
          if (callback != null) {
            Future.delayed(const Duration(seconds: 1), () => callback());
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
