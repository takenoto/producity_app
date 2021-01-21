import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:producity_app/presentation/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case HomeScreen.RouteName:
        screen = HomeScreen();
        break;
      case PomodoroRunningScreen.RouteName:
        screen = PomodoroRunningScreen();
        break;
      case PomodoroSessionSelectorScreen.RouteName:
        screen = PomodoroSessionSelectorScreen();
        break;
      default:
        screen = ErrorScreen();
    }

    return MaterialPageRoute(builder: (context) => screen);
  }
}
