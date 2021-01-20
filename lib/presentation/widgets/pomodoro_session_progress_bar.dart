import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro.dart';
import 'package:provider/provider.dart';

class PomodoroSessionProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    return Selector<PomodoroSessionNotifier, int>(
        selector: (_, pomoSessionNotifier) =>
            pomoSessionNotifier.pomodoroSession.currentPomodoroIndex,
        builder: (_, currentIndex, child) {
          children?.clear;
          //TODO criar as children baseando no index atual
          List<Pomodoro> pomodoros =
              Provider.of<PomodoroSessionNotifier>(context, listen: false)
                  .pomodoroSession
                  .pomodoros;
          for (int i = 0; i < pomodoros.length; i++) {
            if (i < currentIndex) {
              //decide se roxo ou verde
              children?.add(_PomodoroSessionBarChild(
                  pomodoros[i].type == PomoType.work
                      ? kWorkColorBright
                      : kRestColorBright));
            } else {
              children?.add(_PomodoroSessionBarChild(kLightColorShade3));
            }
          }
          return SizedBox(
            width: kProgressIndicatiorBarItemSize * (pomodoros.length + 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: children,
            ),
          );
          //até o index atual, colorido, passou é cinza
          //Pelo próprio index ela sabe se é verde ou roxo
        });
  }
}

class _PomodoroSessionBarChild extends StatelessWidget {
  final Color color;
  _PomodoroSessionBarChild(this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kProgressIndicatiorBarItemSize,
      height: kProgressIndicatiorBarItemSize,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
