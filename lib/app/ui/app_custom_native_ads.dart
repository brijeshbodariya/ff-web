import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/custom_ad_helper.dart';
import 'app_button.dart';
import 'app_image_assets.dart';
import 'app_text.dart';

class AppCustomNativeAds extends StatefulWidget {
  final double? topPadding;

  const AppCustomNativeAds({super.key, this.topPadding = 0.0});

  @override
  State<AppCustomNativeAds> createState() => _AppCustomNativeAdsState();
}

class _AppCustomNativeAdsState extends State<AppCustomNativeAds> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CustomAdHelper.nativeGifList.shuffle();
    CustomAdHelper.nativeAdImageList.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomAdHelper.isNativeAdShow
        ? GestureDetector(
            onTap: () => CustomAdHelper.interstitialAd(callback: () {}, isAdUrl: CustomAdHelper.isNativeAdUrl),
            // onTap: () => CustomAdHelper.launchURLInDefaultBrowserOnAndroid(context, url: CustomAdHelper.isNativeAdUrl),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0).copyWith(top: widget.topPadding),
              height: 275.0,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColorConstants.appTransparent,
                // color: AppColorConstants.appGray.withOpacity(0.18),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: AppImageAsset(
                            image: CustomAdHelper.nativeGifList.first,
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: CustomAdHelper.appNativeAdTitle,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppText(
                                  text: CustomAdHelper.appNativeAdDescription,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 18,
                            width: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColorConstants.appOrange,
                              borderRadius: BorderRadius.circular(3.0),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: AppImageAsset(
                          image: CustomAdHelper.nativeAdImageList.first,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    onTap: () => CustomAdHelper.interstitialAd(callback: () {}, isAdUrl: CustomAdHelper.isNativeAdUrl),
                    text: CustomAdHelper.appNativeAdButtonTitle,
                    fontSize: 14,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(10),
                    height: 43.5,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
