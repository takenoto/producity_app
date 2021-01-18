import 'package:meta/meta.dart';
import 'package:producity_app/constants/errors.dart';
import 'package:producity_app/data/models/pomodoro.dart';

class PomodoroSession {
  final String name;
  int _currentPomoIndex = 0;
  List<Pomodoro> pomodoros;

  PomodoroSession({@required this.name, List<Pomodoro> pomodoros}) {
    pomodoros != null ? this.pomodoros = pomodoros : this.pomodoros = [];
  }

  set currentPomodoroIndex(int newPomoNumber) {
    if (newPomoNumber < pomodoros.length) {
      _currentPomoIndex = newPomoNumber;
    } else {
      throw CantSetPomodoroNumberError();
    }
  }

  void nextPomodoro() {
    if (_currentPomoIndex < pomodoros.length) _currentPomoIndex++;
  }

  Pomodoro get currentPomodoro => pomodoros[_currentPomoIndex];

  PomodoroSession copyWith({String name}) {
    return PomodoroSession(name: name ?? this.name)
      ..currentPomodoroIndex = this._currentPomoIndex;
  }
}
