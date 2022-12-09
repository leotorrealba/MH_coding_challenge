import 'package:coding_challenge/pages/details.dart';
import 'package:coding_challenge/pages/home.dart';
import 'package:coding_challenge/routes/routes_names.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());

      case RoutesName.details:
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) => DetailsPage());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
