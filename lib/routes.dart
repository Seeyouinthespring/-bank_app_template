import 'package:bank_app_template/screens/qr_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String home = '/home';
  static const String qr = '/qr';
  static const String profile = '/profile';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      qr: (context) => QrScreen(),
    };

    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}
