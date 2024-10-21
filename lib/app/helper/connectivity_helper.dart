import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constant.dart';
import '../ui/app_text.dart';
import '../ui/app_ui_helper.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();
  late Connectivity connectivity = Connectivity();
  late ConnectivityResult result;
  late bool isConnected = false;
  bool isDialogOpen = false;

  Future<void> isConnectNetworkWithMessage({bool isMain = false}) async {
    connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) async {
      isConnected = await updateConnectionStatus(connectivityResult);
      if (!isConnected && !isDialogOpen && !isMain) {
        commonNoInterNetDialog();
      }
    });
  }

  Future<bool> isCheckConnectivity({bool isSplash = false}) async {
    result = await connectivity.checkConnectivity();
    isConnected = await updateConnectionStatus(result, isSplash: isSplash);
    if (!isConnected && !isDialogOpen) {
      commonNoInterNetDialog(onPressed: isSplash ? () {
        // goToSplashPage();
      } : null);
    }
    return isConnected;
  }

  Future<bool> updateConnectionStatus(ConnectivityResult connectivityResult, {bool isSplash = false}) async {
    log("Connection Status: $connectivityResult");
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.vpn ||
        connectivityResult == ConnectivityResult.other) {
      log("Connected");
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      if (!isDialogOpen) {
        commonNoInterNetDialog(onPressed: isSplash ? () {
          // goToSplashPage();
        } : null);
      }
      log("Not Connected");
      return false;
    } else {
      return true;
    }
  }

  void commonNoInterNetDialog({Function? onPressed}) {
    isDialogOpen = true;
    commonAlertDialog(
        barrierDismissible: false,
        isBackOff: false,
        titleWidget: AppText(
          text: AppStringConstants.noInternetConnection,
          textStyle: Theme.of(Get.context!).textTheme.displaySmall!.copyWith(
                fontSize: 18,
                color: AppColorConstants.appBlack,
              ),
        ),
        contentWidget: AppText(
          text: AppStringConstants.noInternetConnectionMessage,
          textStyle: Theme.of(Get.context!).textTheme.displaySmall!.copyWith(
                fontSize: 14,
                color: AppColorConstants.appBlack.withOpacity(0.4),
              ),
        ),
        actions: [
          TextButton(
            child: const AppText(
              text: AppStringConstants.tryAgain,
            ),
            onPressed: () async {
              bool isConnect = await isCheckConnectivity();
              if (isConnect) {
                isDialogOpen = false;
                Navigator.pop(Get.context!);
                if (onPressed != null) {
                  onPressed();
                }
              }
            },
          ),
        ]);
  }
}
