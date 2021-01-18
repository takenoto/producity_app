import 'package:flutter/material.dart';
import 'package:producity_app/presentation/pages/pomodoro_home_page.dart';
import 'package:producity_app/presentation/screens/pomodoro_running_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            debugPrint('TAP! @ ${this.runtimeType}');
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PomodoroRunningScreen()));
          },
          child: PomodoroHomePage()),
    );
  }
}
