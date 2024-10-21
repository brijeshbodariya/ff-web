import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../app/helper/app_helper.dart';
import '../page/characters/characters_page.dart';
import '../page/diamond_calculator/diamond_calculator_page.dart';
import '../page/diamond_count/diamond_count_page.dart';
import '../page/exit/exit_page.dart';
import '../page/get_daily_diamond/get_daily_diamond_page.dart';
import '../page/home/home_page.dart';
import '../page/image_with_info/image_with_info_page.dart';
import '../page/info/info_page.dart';
import '../page/lets_started/lets_started_page.dart';
import '../page/map/map_details_page.dart';
import '../page/map/map_page.dart';
import '../page/pets/pets_page.dart';
import '../page/rare_emotes/rare_emotes_page.dart';
import '../page/select_id_level/select_id_level_page.dart';
import '../page/select_player_category/select_player_category_page.dart';
import '../page/select_rank/select_rank_page.dart';
import '../page/splash/splash_page.dart';
import '../page/vehicle/vehicle_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String letsStartedPage = '/letsStartedPage';
  static const String homePage = '/homePage';
  static const String vehiclePage = '/vehiclePage';
  static const String selectRankPage = '/selectRankPage';
  static const String imageWithInfoPage = '/imageWithInfoPage';
  static const String selectPlayerCategoryPage = '/selectPlayerCategoryPage';
  static const String selectIdLevelPage = '/selectIdLevelPage';
  static const String rareEmotesPage = '/rareEmotesPage';
  static const String petsPage = '/petsPage';
  static const String mapPage = '/mapPage';
  static const String mapDetailsPage = '/mapDetailsPage';
  static const String charactersPage = '/charactersPage';
  static const String diamondCalculatorPage = '/diamondCalculatorPage';
  static const String diamondCountPage = '/diamondCountPage';
  static const String exitPage = '/exitPage';
  static const String getDailyDiamondPage = '/getDailyDiamondPage';
  static const String infoPage = '/infoPage';
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logs('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logs('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logs('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logs('MyTest didReplace: $newRoute');
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

String? _redirect(BuildContext context, GoRouterState state) {
  logs("_redirect -> ${state.uri.path}");
  return state.uri.path; // initially it was '/' then path
}

final router = GoRouter(
  initialLocation: RouteHelper.initial,
  navigatorKey: _rootNavigatorKey,
  redirect: _redirect,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    GoRoute(
      path: RouteHelper.initial,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: SplashPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.letsStartedPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: LetsStartedPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.homePage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: HomePage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.vehiclePage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: VehiclePage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.selectRankPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: SelectRankPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.imageWithInfoPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: ImageWithInfoPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.selectPlayerCategoryPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: SelectPlayerCategoryPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.selectIdLevelPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: SelectIdLevelPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.rareEmotesPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: RareEmotesPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.petsPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: PetsPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.infoPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: InfoPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.mapPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: MapPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.charactersPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: CharactersPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.diamondCalculatorPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: DiamondCalculatorPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.exitPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: ExitPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.getDailyDiamondPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: GetDailyDiamondPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.diamondCountPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: DiamondCountPage(),
        );
      },
    ),
    GoRoute(
      path: RouteHelper.mapDetailsPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: MapDetailsPage(),
        );
      },
    ),
  ],
);
