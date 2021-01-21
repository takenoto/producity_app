import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';
import 'package:producity_app/presentation/pages/pomodoro_home_page.dart';
import 'package:producity_app/presentation/screens/pomodoro_running_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String RouteName = 'HOMESCREEN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Provider.of<PomodoroSessionNotifier>(context, listen: false)
                .pomodoroSession = PomodoroSession.mockDefault();
            Navigator.of(context).pushNamed(PomodoroRunningScreen.RouteName);
          },
          child: PomodoroHomePage()),
    );
  }
}
