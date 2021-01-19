import 'package:flutter/material.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';

class PomodoroSessionNotifier extends ChangeNotifier {
  PomodoroSession _pomodoroSession;
  PomodoroSessionNotifier(this._pomodoroSession);

  PomodoroSession get pomodoroSession => _pomodoroSession;

  set pomodoroSession(PomodoroSession newPomodoroSession) {
    this._pomodoroSession = newPomodoroSession;
    notifyListeners();
  }

  void nextPomo() {
    _pomodoroSession.nextPomodoro();
    notifyListeners();
  }

  void updateCurrentPomoTime({@required Duration addedDuration}) {
    int newDuration =
        _pomodoroSession.currentPomodoro.completedDuration.inMilliseconds +
            addedDuration.inMilliseconds;
    if (newDuration >=
        _pomodoroSession.currentPomodoro.completedDuration.inMilliseconds) {
      newDuration =
          _pomodoroSession.currentPomodoro.completedDuration.inMilliseconds;
      nextPomo();
    }
    notifyListeners();
  }
}
