// To parse this JSON data, do
//
//     final appAdsModel = appAdsModelFromJson(jsonString);

import 'dart:convert';

AppAdsModel appAdsModelFromJson(String str) => AppAdsModel.fromJson(json.decode(str));

String appAdsModelToJson(AppAdsModel data) => json.encode(data.toJson());

class AppAdsModel {
  int? isAppLive;
  int? isAllAppAdsShow;
  int? isNativeAdShow;
  int? isNativeSmallAdShow;
  int? isBannerAdShow;
  int? isInterAdShow;
  int? isBackButtonAdShow;
  int? userInAdClick;
  int? userOutAdClick;
  String? isNativeAdUrl;
  String? isNativeSmallAdUrl;
  String? isBannerAdUrl;
  String? isInterAdUrl;
  List<String>? nativeAdImageList;
  List<String>? nativeSmallAdImageList;
  List<String>? bannerAdImageList;
  List<String>? nativeGifIconList;
  String? privacyUrl;
  String? title;
  String? description;
  String? buttonTitle;

  AppAdsModel({
    this.isAppLive,
    this.isAllAppAdsShow,
    this.isNativeAdShow,
    this.isNativeSmallAdShow,
    this.isBannerAdShow,
    this.isInterAdShow,
    this.isBackButtonAdShow,
    this.userInAdClick,
    this.userOutAdClick,
    this.isNativeAdUrl,
    this.isNativeSmallAdUrl,
    this.isBannerAdUrl,
    this.isInterAdUrl,
    this.nativeAdImageList,
    this.nativeSmallAdImageList,
    this.bannerAdImageList,
    this.nativeGifIconList,
    this.privacyUrl,
    this.title,
    this.description,
    this.buttonTitle,
  });

  factory AppAdsModel.fromJson(Map<String, dynamic> json) => AppAdsModel(
        isAppLive: json["is_app_live"],
        isAllAppAdsShow: json["is_all_app_ads_show"],
        isNativeAdShow: json["is_native_ad_show"],
        isNativeSmallAdShow: json["is_native_small_ad_show"],
        isBannerAdShow: json["is_banner_ad_show"],
        isInterAdShow: json["is_inter_ad_show"],
        isBackButtonAdShow: json["is_back_button_ad_show"],
        userInAdClick: json["user_in_ad_click"],
        userOutAdClick: json["user_out_ad_click"],
        isNativeAdUrl: json["is_native_ad_url"],
        isNativeSmallAdUrl: json["is_native_small_ad_url"],
        isBannerAdUrl: json["is_banner_ad_url"],
        isInterAdUrl: json["is_inter_ad_url"],
        nativeAdImageList:
            json["native_ad_image_list"] == null ? [] : List<String>.from(json["native_ad_image_list"]!.map((x) => x)),
        nativeSmallAdImageList: json["native_small_ad_image_list"] == null
            ? []
            : List<String>.from(json["native_small_ad_image_list"]!.map((x) => x)),
        bannerAdImageList:
            json["banner_ad_image_list"] == null ? [] : List<String>.from(json["banner_ad_image_list"]!.map((x) => x)),
        nativeGifIconList:
            json["native_gif_icon_List"] == null ? [] : List<String>.from(json["native_gif_icon_List"]!.map((x) => x)),
        privacyUrl: json["privacy"],
        title: json["title"],
        description: json["description"],
        buttonTitle: json["button_title"],
      );

  Map<String, dynamic> toJson() => {
        "is_app_live": isAppLive,
        "is_all_app_ads_show": isAllAppAdsShow,
        "is_native_ad_show": isNativeAdShow,
        "is_native_small_ad_show": isNativeSmallAdShow,
        "is_banner_ad_show": isBannerAdShow,
        "is_inter_ad_show": isInterAdShow,
        "is_back_button_ad_show": isBackButtonAdShow,
        "user_in_ad_click": userInAdClick,
        "user_out_ad_click": userOutAdClick,
        "is_native_ad_url": isNativeAdUrl,
        "is_native_small_ad_url": isNativeSmallAdUrl,
        "is_banner_ad_url": isBannerAdUrl,
        "is_inter_ad_url": isInterAdUrl,
        "native_ad_image_list": nativeAdImageList == null ? [] : List<dynamic>.from(nativeAdImageList!.map((x) => x)),
        "native_small_ad_image_list":
            nativeSmallAdImageList == null ? [] : List<dynamic>.from(nativeSmallAdImageList!.map((x) => x)),
        "banner_ad_image_list": bannerAdImageList == null ? [] : List<dynamic>.from(bannerAdImageList!.map((x) => x)),
        "native_gif_icon_List": nativeGifIconList == null ? [] : List<dynamic>.from(nativeGifIconList!.map((x) => x)),
        "privacy": privacyUrl,
        "title": title,
        "description": description,
        "button_title": buttonTitle,
      };
}
