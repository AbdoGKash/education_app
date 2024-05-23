// ignore_for_file: prefer_const_constructors
import 'package:education_app/presentation/screen/main_screen.dart';
import 'package:education_app/presentation/screen/onboarding.dart';
import 'package:flutter/material.dart';

import '../../presentation/screen/english_in_movice_content.dart';
import '../../presentation/screen/english_in_work_content.dart';
import '../../presentation/screen/settings.dart';
import '../../presentation/screen/show_video.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String mainScreen = "/main_screen";
  static const String englishInWorkContent = "/EnglishInWorkContent";
  static const String englishInMoviceContent = "/EnglishInMoviceContent";
  static const String showVideo = "/ShowVideo";
  static const String addNote = "/AddNote";
  static const String viewNote = "ViewNote";
  static const String setting = "setting";
  // // static const String onBoardingRoute = "/onBoarding";
  // // static const String mainRoute = "/main";
  // // static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.englishInWorkContent:
        return MaterialPageRoute(builder: (_) => EnglishInWorkContent());
      case Routes.englishInMoviceContent:
        return MaterialPageRoute(builder: (_) => EnglisInMoviceContent());
      case Routes.showVideo:
        return MaterialPageRoute(builder: (_) => ShowVideo());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => Settings());
      // case Routes.addNote:
      //   return MaterialPageRoute(builder: (_) => AddNote());
      // case Routes.mainRoute:
      //   initHomeModule();
      //   return MaterialPageRoute(builder: (_) => const MainView());
      // case Routes.storeDetailsRoute:
      //   initStoreDetailsModule();
      //   return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("noRouteFound"),
              ),
              body: Center(child: Text("noRouteFound")),
            ));
  }
}
