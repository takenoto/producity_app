import 'package:flutter/material.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';

class PomodoroCard extends StatelessWidget {
  final bool colorIsHighlight;
  final PomodoroSession pomodoroSession;
  PomodoroCard(
      {@required this.colorIsHighlight, @required this.pomodoroSession});

  @override
  Widget build(BuildContext context) {
    Color cardColor = colorIsHighlight ? kWorkColor : kLightColor;
    return Container(
      padding: EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: [
            BoxShadow(color: kWorkColorBright.withAlpha(90), blurRadius: 16),
          ]),
      child: Row(
        children: [
          Column(
            children: [
              Text(pomodoroSession.name),
              Text('a'
                  //TODO: Colocar o número de sessões de trabalho dinamicamente
                  )
            ],
          ),
          SizedBox(
            height: kPadding,
            width: kPadding,
          ),
          Column(
            children: [
              Text('Descanso'),
              Text('5min'),
            ],
          ),
        ],
      ),
    );
  }
}
