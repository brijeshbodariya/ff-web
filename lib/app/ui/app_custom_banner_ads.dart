import 'package:flutter/material.dart';

import '../helper/custom_ad_helper.dart';
import 'app_image_assets.dart';

class AppCustomBannerAds extends StatefulWidget {
  const AppCustomBannerAds({super.key});

  @override
  State<AppCustomBannerAds> createState() => _AppCustomBannerAdsState();
}

class _AppCustomBannerAdsState extends State<AppCustomBannerAds> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CustomAdHelper.bannerAdImageList.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomAdHelper.isBannerAdShow
        ? GestureDetector(
            onTap: () => CustomAdHelper.launchURLInDefaultBrowserOnAndroid(context, url: CustomAdHelper.isBannerAdUrl),
            child: Container(
              height: 55,
              margin: const EdgeInsets.all(3).copyWith(top: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: AppImageAsset(
                  image: CustomAdHelper.bannerAdImageList.first,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
