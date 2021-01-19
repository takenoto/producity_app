import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class PomodoroCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: CustomPaint(
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
        Align(
          alignment: Alignment.center,
          child: Text('AAA this is a text'),
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
    final Paint paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = kStrokeWidth;

    //Círculo do fundo
    canvas.drawCircle(
        Offset(radius, radius), radius, paint..color = kLightColorShade2);
    //Círculo que representa o progresso
    // canvas.drawCircle(
    //     Offset(radius, radius), radius, paint..color = progressColor);

    double angle = 360 * percentCompletion * math.pi / 180;
    bool angleGreaterThan180 = angle > math.pi;

    // double x =
    //     math.sqrt((math.pow(radius, 2) / (1 + (math.pow(math.cos(angle), 2)))));
    // print('r = $radius');
    // print('sin = ${math.sin(angle)}');

    // if (angleGreaterThan180) x = -x;

    // double y = angleGreaterThan180
    //     ? math.sqrt((math.pow(radius, 2) - (math.pow(x, 2))))
    //     : math.sqrt((math.pow(radius, 2) - (math.pow(x, 2)))) - radius;

    // debugPrint('x = $x, y = $y');

    // Path circlePath = Path()
    //   ..moveTo(radius, 0)
    //   ..relativeArcToPoint(
    //     Offset(x, y + radius),
    //     radius: Radius.circular(radius),
    //     largeArc: angleGreaterThan180 ? true : false,
    //   );

    // // Path completeCircle = Path()
    // //   ..addOval(Rect.fromCenter(
    // //       height: radius * 2,
    // //       width: radius * 2,
    // //       center: Offset(radius, radius)));

    // canvas.drawPath(circlePath, paint..color = progressColor);

    canvas.drawArc(Offset.zero & size, -math.pi / 2, angle, false,
        paint..color = progressColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
