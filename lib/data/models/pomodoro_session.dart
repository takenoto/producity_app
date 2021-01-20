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

  Duration get sessionDuration => Duration(
      seconds: pomodoros.fold(
          0, (prev, item) => prev + item.completedDuration.inSeconds));

  set currentPomodoroIndex(int newPomoNumber) {
    if (newPomoNumber < pomodoros.length) {
      _currentPomoIndex = newPomoNumber;
    } else {
      throw CantSetPomodoroNumberError();
    }
  }

  int get currentPomodoroIndex => _currentPomoIndex;

  void nextPomodoro() {
    if (_currentPomoIndex < pomodoros.length) _currentPomoIndex++;
  }

  Pomodoro get currentPomodoro => pomodoros[_currentPomoIndex];

  void endCurrentPomodoro({@required currentPomodoroCompletedDuration}) {}

  PomodoroSession copyWith({String name}) {
    return PomodoroSession(name: name ?? this.name)
      ..currentPomodoroIndex = this._currentPomoIndex;
  }

  static PomodoroSession mockDefault() {
    return PomodoroSession(name: 'Pomodoro Clássico', pomodoros: [
      Pomodoro(type: PomoType.work, totalDuration: Duration(minutes: 25)),
      Pomodoro(type: PomoType.rest, totalDuration: Duration(minutes: 5)),
      Pomodoro(type: PomoType.work, totalDuration: Duration(minutes: 25)),
      Pomodoro(type: PomoType.rest, totalDuration: Duration(minutes: 5)),
      Pomodoro(type: PomoType.bigRest, totalDuration: Duration(minutes: 25)),
    ]);
  }
}
