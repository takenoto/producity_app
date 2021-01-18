import 'package:meta/meta.dart';

enum PomoType { work, rest, bigRest, none }

class PomodoroBasis {
  final Duration duration;
  Duration completedDuration = Duration(seconds: 0);
  PomodoroBasis(this.duration);

  void setFinished() {
    completedDuration = Duration(milliseconds: duration.inMilliseconds);
  }
}

class Pomodoro extends PomodoroBasis {
  final PomoType type;
  Pomodoro({@required this.type, @required Duration totalDuration})
      : super(totalDuration);

  @override
  Duration get completedDuration => super.completedDuration;

  @override
  set completedDuration(Duration duration) {
    super.completedDuration = duration;
  }
}
