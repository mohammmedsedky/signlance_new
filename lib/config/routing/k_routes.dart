import 'package:flutter/material.dart';

import '../../screens/splash/view/splash_page.dart';
import 'route_transitions.dart';

class KAppRoutes {
  static const String splash = "/";
  static const String login = "/login";

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return createRoute(const SplashPage());
    }
    return null;
  }
}
