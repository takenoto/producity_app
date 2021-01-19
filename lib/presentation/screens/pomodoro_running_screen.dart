import 'package:flutter/material.dart';
import 'package:producity_app/presentation/widgets/pomodoro_circle_widget.dart';

class PomodoroRunningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: Center(
        child: PomodoroCircleWidget(),
      ),
    );
  }
}
