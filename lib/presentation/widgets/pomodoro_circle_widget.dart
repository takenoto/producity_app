import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro.dart';
import 'package:provider/provider.dart';

import '../../business_logic/pomodoro_session_notifier.dart';

class PomodoroCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline2;
    Pomodoro currentPomo =
        Provider.of<PomodoroSessionNotifier>(context, listen: false)
            .pomodoroSession
            .currentPomodoro;
    double size = MediaQuery.of(context).size.width.toDouble();
    double circleRadius = size / 2.75;
    return SizedBox(
      height: size,
      width: size,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Selector<PomodoroSessionNotifier, double>(
            selector: (_, pomoNotifier) =>
                pomoNotifier.pomodoroSession.currentPomodoro.percentCompleted,
            builder: (_, percentCompleted, child) => CustomPaint(
              painter: CirclePainter(
                radius: circleRadius,
                percentCompletion: currentPomo.percentCompleted,
                progressColor:
                    currentPomo.type == PomoType.rest ? kRestColor : kWorkColor,
              ),
              child: SizedBox(
                height: circleRadius * 2,
                width: circleRadius * 2,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Selector<PomodoroSessionNotifier, String>(
            selector: (_, pomoNotifier) {
              Duration remainingDuration = Duration(
                  seconds: pomoNotifier
                          .pomodoroSession.currentPomodoro.duration.inSeconds -
                      pomoNotifier.pomodoroSession.currentPomodoro
                          .completedDuration.inSeconds);
              String seconds =
                  remainingDuration.inSeconds.remainder(60).toString();
              if (seconds == '0') seconds = '00';
              return remainingDuration.inMinutes.toString() + ':' + seconds;
            },
            builder: (_, timeString, child) => Text(
              timeString,
              style: textStyle,
            ),
          ),
        )
      ]),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double radius;

  ///Should be 0<[percentCompletion]<1
  final double percentCompletion;
  final Color progressColor;

  CirclePainter(
      {@required this.radius,
      @required this.percentCompletion,
      @required this.progressColor});

  @override
  void paint(Canvas canvas, Size size) {
    double startingAngle = -math.pi / 2;

    final Paint paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = kStrokeWidth;

    //Círculo do fundo
    canvas.drawCircle(
        Offset(radius, radius), radius, paint..color = kLightColorShade2);

    double angle = 360 * percentCompletion * math.pi / 180;
    bool angleGreaterThan180 = angle > math.pi;

    //Arco do progresso
    canvas.drawArc(Offset.zero & size, startingAngle, angle, false,
        paint..color = progressColor);

    //Círculo do meio onde começam as coisas
    canvas.drawCircle(
        Offset(radius, 0), kStrokeWidth, Paint()..color = paint.color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
