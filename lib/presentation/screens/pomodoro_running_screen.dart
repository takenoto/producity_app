import 'dart:async';

import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/notifications/pomodoro_control_notification.dart';
import 'package:producity_app/presentation/pages/pomodoro_session_finished_page.dart';
import 'package:producity_app/presentation/widgets/pomodoro_circle_widget.dart';
import 'package:producity_app/presentation/widgets/pomodoro_control_menu.dart';
import 'package:producity_app/presentation/widgets/pomodoro_session_progress_bar.dart';
import 'package:provider/provider.dart';

class PomodoroRunningScreen extends StatefulWidget {
  static const String RouteName = 'POMODORORUNNINGSCREEN';

  @override
  _PomodoroRunningScreenState createState() => _PomodoroRunningScreenState();
}

class _PomodoroRunningScreenState extends State<PomodoroRunningScreen> {
  _PeriodicStreamUpdater _periodicStreamUpdater;
  PomodoroSessionNotifier _pomodoroSessionNotifier;
  Function notifierObserver;
  PomodoroSessionStatus previousStreamStatus;

  @override
  void initState() {
    super.initState();
    _periodicStreamUpdater = _PeriodicStreamUpdater(updateCurrentPomodoroTime);
    previousStreamStatus = PomodoroSessionStatus.inProgress;
    notifierObserver = () {
      PomodoroSessionStatus currentStatus =
          _pomodoroSessionNotifier.pomodoroSessionStatus;
      if (currentStatus != previousStreamStatus) {
        previousStreamStatus = currentStatus;
        if (currentStatus == PomodoroSessionStatus.paused) {
          _periodicStreamUpdater?.pause();
        } else if (currentStatus == PomodoroSessionStatus.inProgress) {
          _periodicStreamUpdater?.resume();
        } else
          _periodicStreamUpdater?.close();
      }
    };
    _periodicStreamUpdater.resume();
  }

  @override
  void dispose() {
    _periodicStreamUpdater?.close();
    _pomodoroSessionNotifier?.removeListener(notifierObserver);
    super.dispose();
  }

  void updateCurrentPomodoroTime(Duration dt) {
    Provider.of<PomodoroSessionNotifier>(context, listen: false)
        ?.updateCurrentPomoTime(addedDuration: dt);
  }

  @override
  Widget build(BuildContext context) {
    _pomodoroSessionNotifier = Provider.of<PomodoroSessionNotifier>(context);
    _pomodoroSessionNotifier.addListener(notifierObserver);

    return Scaffold(
      //TODO: Add notification Listener
      body: NotificationListener<PomodoroControlNotification>(
        onNotification: (PomodoroControlNotification notification) {
          notification.action(
              sessionNotifier:
                  Provider.of<PomodoroSessionNotifier>(context, listen: false));
          return true;
        },
        child: Center(
          child: Selector<PomodoroSessionNotifier, bool>(
              selector: (_, pomoNotifier) =>
                  pomoNotifier.pomodoroSessionStatus ==
                  PomodoroSessionStatus.finished,
              builder: (_, isFinished, child) {
                if (!isFinished) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    PomodoroSessionProgressBar(),
                    PomodoroCircleWidget(),
                    PomodoroControllerMenu()
                  ]);
                } else
                  return PomodoroSessionFinishedPage();
              }),
        ),
      ),
    );
  }
}

typedef StreamTimeTicker(Duration dt);

class _PeriodicStreamUpdater {
  DateTime _previousTime = DateTime.now();
  DateTime _currentTime = DateTime.now();
  Duration _elapsedTime;
  Duration get elapsedTime => _elapsedTime;
  StreamSubscription streamSubscription;

  StreamTimeTicker callBack;

  _PeriodicStreamUpdater(this.callBack) {
    streamSubscription =
        Stream.periodic(Duration(milliseconds: 40), (i) {}).listen((event) {
      _currentTime = DateTime.now();
      _elapsedTime = _currentTime.difference(_previousTime);
      _previousTime = _currentTime;
      callBack(_elapsedTime);
    });
  }

  void resume() {
    _previousTime = DateTime.now();
    _currentTime = DateTime.now();
    streamSubscription?.resume();
  }

  void pause() {
    streamSubscription?.pause();
  }

  void close() {
    streamSubscription?.cancel();
    streamSubscription = null;
  }
}
