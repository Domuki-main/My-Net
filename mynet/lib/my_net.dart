import 'package:flutter/material.dart';
import 'package:mynet/routes.dart';

//This class is the entrance of the application
class MyNet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Net',
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
