import 'dart:async';
import 'dart:developer';

import 'package:daily_diamond/app/ui/web_common_view.dart';
import 'package:daily_diamond/routes/route_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/constants/app_constant.dart';
import 'app/helper/connectivity_helper.dart';
import 'app/helper/scroll_helper.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColorConstants.appTransparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(const MyApp());
  }, (error, stack) {
    log("main error:  ${error.toString()}\n\n$stack");
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    interNetConnectionCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetMaterialApp.router(
        title: AppStringConstants.appName,
        // navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        transitionDuration: const Duration(microseconds: 0),
        scrollBehavior: ScrollHelper(),
        // home: const SplashPage(),
        // getPages: RouteHelper.routes,
        routerDelegate: router.routerDelegate,
        backButtonDispatcher: router.backButtonDispatcher,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        // initialRoute: RouteHelper.routeInitial,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColorConstants.appLightSkyBlue,
        ),
        locale: Get.deviceLocale,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: WebCommonView(child: child!),
          );
        },
      ),
    );
  }

  Future<void> interNetConnectionCheck() async {
    ConnectivityService connectivityService = ConnectivityService.instance;
    print("App Started ${kIsWeb ? "Web" : "Mobile"}");
    connectivityService.isConnectNetworkWithMessage(isMain: true);
  }
}
