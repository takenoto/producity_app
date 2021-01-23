import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/widget_ids.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';
import 'package:producity_app/presentation/screens/screens.dart';
import 'package:producity_app/presentation/widgets/pomodoro_control_menu.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Pomodoro Control Menu CHECK Action TEST',
      (WidgetTester tester) async {
    await tester.pumpWidget((ChangeNotifierProvider<PomodoroSessionNotifier>(
      create: (_) => PomodoroSessionNotifier(PomodoroSession.mockDefault()),
      builder: (_, child) {
        return PomodoroRunningScreen();
      },
    )));

    // final checkButton = tester
    //     .firstWidget<IconButton>(find.widgetWithIcon(IconButton, Icons.check));
    final checkButton = find.byKey(Key(kPomodoroControllerCheckSkip));
    expect(checkButton, findsOneWidget);

    // print(checkButton.icon);
  });
}
