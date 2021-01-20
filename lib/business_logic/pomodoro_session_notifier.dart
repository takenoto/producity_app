import 'package:flutter/material.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';

enum PomodoroSessionStatus { inProgress, finished }

class PomodoroSessionNotifier extends ChangeNotifier {
  PomodoroSession _pomodoroSession;
  PomodoroSessionStatus _pomodoroSessionStatus =
      PomodoroSessionStatus.inProgress;
  PomodoroSessionNotifier(this._pomodoroSession);

  PomodoroSession get pomodoroSession => _pomodoroSession;

  set pomodoroSession(PomodoroSession newPomodoroSession) {
    this._pomodoroSession = newPomodoroSession;
    _pomodoroSessionStatus = PomodoroSessionStatus.inProgress;
    notifyListeners();
  }

  PomodoroSessionStatus get pomodoroSessionStatus => _pomodoroSessionStatus;

  void endSession() {
    _pomodoroSessionStatus = PomodoroSessionStatus.finished;
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
