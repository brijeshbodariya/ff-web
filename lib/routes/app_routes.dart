import 'package:daily_diamond/routes/route_helper.dart';
import 'dart:html' as html;

void saveData(String key, String value) {
  html.window.localStorage[key] = value;
}

String? loadData(String key) {
  return html.window.localStorage[key];
}

goToBack() {
  html.window.history.back();
}

goToLetsStartedPage() {
  router.go(RouteHelper.letsStartedPage);
}

goToHomePage() {
  router.go(RouteHelper.homePage);
}

goToVehiclePage() {
  router.go(RouteHelper.vehiclePage);
}

goToSelectRankPage() {
  router.go(RouteHelper.selectRankPage);
}

goToImageWithInfoPage() {
  router.go(RouteHelper.imageWithInfoPage);
}

goToSelectPlayerCategoryPage() {
  router.go(RouteHelper.selectPlayerCategoryPage);
}

goToSelectIdLevelPage() {
  router.go(RouteHelper.selectIdLevelPage);
}

goToRareEmotesPage() {
  router.go(RouteHelper.rareEmotesPage);
}

goToPetsPage() {
  router.go(RouteHelper.petsPage);
}

goToMapPage() {
  router.go(RouteHelper.mapPage);
}

goToMapDetailsPage() {
  router.go(RouteHelper.mapDetailsPage);
}

goToCharactersPage() {
  router.go(RouteHelper.charactersPage);
}

goToDiamondCalculatorPage() {
  router.go(RouteHelper.diamondCalculatorPage);
}

goToDiamondCountPage() {
  router.go(RouteHelper.diamondCountPage);
}

goToExitPage() {
  router.go(RouteHelper.exitPage);
}

goToGetDailyDiamondPage() {
  router.go(RouteHelper.getDailyDiamondPage);
}

goToInfoPage() {
  router.go(RouteHelper.infoPage);
}
