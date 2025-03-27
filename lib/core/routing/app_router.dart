import 'package:flutter/material.dart';
import 'package:idraak/core/routing/routes.dart';
import 'package:idraak/features/home/ui/home_screen.dart';
import 'package:idraak/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),

          settings: settings,
        );

      default:
        return null;
    }
  }
}
