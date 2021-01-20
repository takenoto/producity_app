import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro.dart';
import 'package:provider/provider.dart';

class PomodoroControllerMenu extends StatelessWidget {
  final Function pauseFunction;
  final Function playFunction;
  final Function checkFunction;
  final Function stopFunction;
  PomodoroControllerMenu(
      {this.pauseFunction,
      this.playFunction,
      this.checkFunction,
      this.stopFunction});

//TODO PASSAR CADA MÉTODO PARA SEU WIDGET

  @override
  Widget build(BuildContext context) {
    PomoType pomoType;
    Color color;
    return Selector<PomodoroSessionNotifier, PomoType>(
      selector: (_, pomoSessionNotifier) =>
          pomoSessionNotifier.pomodoroSession.currentPomodoro.type,
      builder: (_, selectorValue, child) {
        pomoType = Provider.of<PomodoroSessionNotifier>(context, listen: false)
            .pomodoroSession
            .currentPomodoro
            .type;
        color = pomoType == PomoType.work ? kWorkColor : kRestColor;
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: color,
                ),
                onPressed: () {}),
            _PlayAndPauseButton(),
            IconButton(icon: Icon(Icons.stop, color: color), onPressed: () {}),
          ],
        );
      },
    );
  }
}

///Não precisa dar rebuild quando alterar a cor porque o widget pai já fará isso
class _PlayAndPauseButton extends StatefulWidget {
  @override
  __PlayAndPauseButtonState createState() => __PlayAndPauseButtonState();
}

class __PlayAndPauseButtonState extends State<_PlayAndPauseButton> {
  @override
  Widget build(BuildContext context) {
    PomoType pomoType =
        Provider.of<PomodoroSessionNotifier>(context, listen: false)
            .pomodoroSession
            .currentPomodoro
            .type;
    Color color = pomoType == PomoType.work ? kWorkColor : kRestColor;
    //TODO: Fazer ele trocar de play para pause e vice-versa quando for pressionado
    return FlatButton(
      padding: EdgeInsets.all(kPadding),
      child: Icon(
        Icons.play_arrow,
        size: IconTheme.of(context).size * 1.25,
        color: color,
      ),
      onPressed: () {},
      shape: CircleBorder(
          side: BorderSide(
        width: kButtonStrokeWidth,
        color: color,
      )),
    );
  }
}
