import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app/constants/app_constant.dart';
import '../app/helper/custom_ad_helper.dart';
import '../app/helper/rest_helper.dart';
import '../model/app_ads_model.dart';

class SplashController extends GetxController {
  RestServices restServices = RestServices.instance;
  RestConstants restConstants = RestConstants.instance;
  AppAdsModel? appAdsModel;

  Future<void> init() async {
    if (kIsWeb) {
      final String response = await rootBundle.loadString(AppAssetsConstants.adsDataPath);
      appAdsModel = appAdsModelFromJson(response);
      if (appAdsModel != null) {
        CustomAdHelper.setAdsResponse(appAdsModel: appAdsModel ?? AppAdsModel());
        AppStringConstants.appPrivacyPolicy = appAdsModel?.privacyUrl ?? '';
        update();
      }
      print("Response $response");
      update();
    }
  }

  Future<void> getAdsResponse() async {
    if (!kIsWeb) {
      final response = await restServices.getRestCall(endpoint: restConstants.adsRestEndPoint);
      if (response != null && response.isNotEmpty) {
        appAdsModel = appAdsModelFromJson(response);
        if (appAdsModel != null) {
          CustomAdHelper.setAdsResponse(appAdsModel: appAdsModel ?? AppAdsModel());
          AppStringConstants.appPrivacyPolicy = appAdsModel?.privacyUrl ?? '';
        }
        update();
      }
    }
  }
}
