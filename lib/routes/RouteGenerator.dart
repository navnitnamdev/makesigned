import 'package:flutter/material.dart';
import 'package:signed/Login/LoginPage.dart';
import 'package:signed/view/ScreenThreegetvalue.dart';

import 'AppRoutes.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return buildRoute(LoginPage(), settings: settings);
      case AppRoutes.ScreenThreegetvalue:
        return buildRoute(const Screenthreegetvalue(), settings: settings);
   /*   case AppRoutes.profile:
        final arguments = settings.arguments as ProfileArguments;
        return buildRoute(const Profile(arguments: arguments), settings: settings);
      case AppRoutes.settings:
        return buildRoute(const Settings(), settings: settings);*/
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 450.0,
                  width: 450.0,
                  child: Text("No screen available for routs"),
                ),
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}