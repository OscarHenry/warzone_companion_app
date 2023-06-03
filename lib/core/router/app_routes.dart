import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/pages/pages.dart';

class AppRoute {
  static const String initialRoute = DashboardPage.route;

  static RouteFactory onGenerateRoute = (RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case DashboardPage.route:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case DetailPage.route:
        return MaterialPageRoute(
          builder: (_) => DetailPage(post: arg as Post),
        );
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  };
}
