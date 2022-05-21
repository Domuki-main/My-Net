import 'package:flutter/material.dart';
import 'package:mynet/views/first_screen.dart';
import 'package:mynet/views/login_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      // example route without arguments:
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // example route with arguments:
      // case '/editProfile':
      //   return MaterialPageRoute(
      //     builder: (_) => EditProfile(),
      //     settings: settings,
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
