import 'package:flutter/material.dart';
import 'package:taskapp39/utilities/routes.dart';
import 'package:taskapp39/view/page/home_screen.dart';
import '../view/page/login_screen.dart';
import '../view/page/onBoarding.dart';
import '../view/page/register_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashPageRoute:
      return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(), settings: routeSettings);
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingScreen(),
        settings: routeSettings,
      );
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (_) =>  LoginScreen(), settings: routeSettings);
    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());

  case AppRoutes.channelDetailsPageRoute:
  default: return MaterialPageRoute(
  builder: (_) => const HomeScreen(),
  settings: routeSettings,

  );


  }
}
