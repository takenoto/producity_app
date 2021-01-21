import 'package:flutter/material.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';

enum PomodoroSessionStatus { inProgress, paused, finished }

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

  void pauseSession() {
    _pomodoroSessionStatus = PomodoroSessionStatus.paused;
    notifyListeners();
  }

  void resumeSession() {
    _pomodoroSessionStatus = PomodoroSessionStatus.inProgress;
    notifyListeners();
  }

  void nextPomo() {
    if (_pomodoroSession.currentPomodoroIndex >=
        _pomodoroSession.pomodoros.length - 1) {
      _pomodoroSessionStatus = PomodoroSessionStatus.finished;
    } else
      _pomodoroSession.nextPomodoro();
    notifyListeners();
  }

  void updateCurrentPomoTime({@required Duration addedDuration}) {
    int newDuration =
        _pomodoroSession.currentPomodoro.completedDuration.inMilliseconds +
            addedDuration.inMilliseconds;
    if (newDuration >=
        _pomodoroSession.currentPomodoro.totalDuration.inMilliseconds) {
      newDuration =
          _pomodoroSession.currentPomodoro.completedDuration.inMilliseconds;
      _pomodoroSession.currentPomodoro.setFinished();
      nextPomo();
    } else
      _pomodoroSession.currentPomodoro.completedDuration =
          Duration(milliseconds: newDuration);
    notifyListeners();
  }
}
