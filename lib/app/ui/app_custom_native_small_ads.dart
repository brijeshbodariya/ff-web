import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/custom_ad_helper.dart';
import 'app_image_assets.dart';
import 'app_text.dart';

class AppCustomNativeSmallAds extends StatefulWidget {
  const AppCustomNativeSmallAds({super.key});

  @override
  State<AppCustomNativeSmallAds> createState() => _AppCustomNativeSmallAdsState();
}

class _AppCustomNativeSmallAdsState extends State<AppCustomNativeSmallAds> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CustomAdHelper.nativeSmallAdImageList.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomAdHelper.isNativeAdShow
        ? GestureDetector(
            onTap: () =>
                CustomAdHelper.launchURLInDefaultBrowserOnAndroid(context, url: CustomAdHelper.isNativeSmallAdUrl),
            child: Container(
              height: 110,
              margin: const EdgeInsets.all(3).copyWith(top: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: AppImageAsset(
                      image: CustomAdHelper.nativeSmallAdImageList.first,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 17,
                      width: 17,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColorConstants.appOrange,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: const AppText(
                        text: "AD",
                        fontSize: 9.0,
                        fontColor: AppColorConstants.appWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
