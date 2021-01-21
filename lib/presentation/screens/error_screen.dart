import 'package:flutter/material.dart';
import 'package:producity_app/presentation/pages/pomodoro_home_page.dart';
import 'package:producity_app/presentation/screens/pomodoro_running_screen.dart';

class ErrorScreen extends StatelessWidget {
  static const String RouteName = 'ERRORSCREEN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
      child: Text('ROUTE ERROR.\nSORRY!'),
    ));
  }
}
