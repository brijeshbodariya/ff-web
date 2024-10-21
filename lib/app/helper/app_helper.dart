import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routes/app_routes.dart';
import '../constants/app_constant.dart';
import 'custom_ad_helper.dart';

String selectDescription1 = '';
String selectDescription2 = '';
String selectImage = '';
List<VoidCallback> selectList = [
  // goToCharacterPage,
  // goToVehiclePage,
  // goToEmotesPage,
  // goToPetsPage,
  // goToWeaponsPage,
];
List<VoidCallback> calledFunctions = [];

void rateApp() async {
  const url = AppStringConstants.appRate; // Replace with your app's URL
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void privacyPolicy() async {
  String url = AppStringConstants.appPrivacyPolicy; // Replace with your app's URL
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void shareApp() {
  Share.share(AppStringConstants.appShared);
}

Future<void> backButtonAction(bool didPop) async {
  if (didPop) {
    return;
  }
  await CustomAdHelper.interstitialAd(callback: () => goToBack(), isBackButton: true);
}

logs(r) {
  if (kDebugMode) {
    print("$r");
  }
}
