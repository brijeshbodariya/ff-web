import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../constants/app_constant.dart';
import '../helper/custom_ad_helper.dart';
import 'app_image_assets.dart';
import 'app_text.dart';

class AppAppBar extends PreferredSize {
  final String title;
  final bool isSettingShow;
  final bool isBackButtonShow;

  AppAppBar({
    this.title = AppStringConstants.fffDiamond,
    this.isSettingShow = false,
    this.isBackButtonShow = true,
    super.key,
    Widget? child,
    Size? preferredSize,
  }) : super(child: Container(), preferredSize: const Size.fromHeight(56));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isBackButtonShow,
      leading: isBackButtonShow
          ? GestureDetector(
              onTap: () async => await CustomAdHelper.interstitialAd(callback: () => goToBack(), isBackButton: true),
              child: Container(
                padding: const EdgeInsets.all(13.5).copyWith(left: 0, right: 0),
                child: const AppImageAsset(
                  image: AppAssetsConstants.backIcon,
                ),
              ),
            )
          : null,
      title: AppText(
        text: title,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontColor: AppColorConstants.appBlack,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: AppColorConstants.appLightSkyBlue,
      // actions: [
      //   if (isSettingShow)
      //     GestureDetector(
      //       onTap: () {
      //         // goToSettingPage();
      //       } ,
      //       child: Container(
      //         padding: const EdgeInsets.all(17.5),
      //         child: const AppImageAsset(
      //           image: AppAssetsConstants.settingIcon,
      //           color: AppColorConstants.appWhite,
      //         ),
      //       ),
      //     ),
      // ],
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.topRight,
      //       colors: [
      //         Color(0xff7062F2),
      //         Color(0xffB461EA),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
