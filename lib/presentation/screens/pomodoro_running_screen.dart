import 'package:flutter/material.dart';
import 'package:producity_app/presentation/widgets/pomodoro_circle_widget.dart';
import 'package:producity_app/presentation/widgets/pomodoro_control_menu.dart';

class PomodoroRunningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: Center(
        child: Column(
          children: [PomodoroCircleWidget(), PomodoroControllerMenu()],
        ),
      ),
    );
  }
}
