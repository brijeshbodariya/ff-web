import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constant.dart';

commonAlertDialog(
    {Widget? titleWidget,
    Widget? contentWidget,
    List<Widget>? actions,
    bool barrierDismissible = true,
    bool isBackOff = true}) {
  return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(isBackOff),
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColorConstants.appWhite),
                borderRadius: BorderRadius.circular(20)),
            elevation: 1,
            shadowColor: AppColorConstants.appGray,
            title: titleWidget ?? const SizedBox(),
            content: contentWidget ?? const SizedBox(),
            actions: actions,
          ),
        );
      });
}
