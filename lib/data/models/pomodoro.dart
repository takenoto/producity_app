import 'package:meta/meta.dart';

enum PomoType { work, rest, bigRest, none }

class PomodoroBasis {
  final Duration totalDuration;
  Duration completedDuration = Duration(seconds: 0);
  PomodoroBasis(this.totalDuration);

  void setFinished() {
    completedDuration = Duration(milliseconds: totalDuration.inMilliseconds);
  }
}

class Pomodoro extends PomodoroBasis {
  final PomoType type;
  Pomodoro({@required this.type, @required Duration totalDuration})
      : assert(totalDuration.inSeconds > 0),
        super(totalDuration);

  double get percentCompleted =>
      super.completedDuration.inMilliseconds.toDouble() /
      super.totalDuration.inMilliseconds.roundToDouble();

  @override
  Duration get completedDuration => super.completedDuration;

  @override
  set completedDuration(Duration duration) {
    super.completedDuration = duration;
  }
}
