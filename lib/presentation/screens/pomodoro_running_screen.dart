import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/presentation/pages/pomodoro_session_finished_page.dart';
import 'package:producity_app/presentation/widgets/pomodoro_circle_widget.dart';
import 'package:producity_app/presentation/widgets/pomodoro_control_menu.dart';
import 'package:producity_app/presentation/widgets/pomodoro_session_progress_bar.dart';
import 'package:provider/provider.dart';

class PomodoroRunningScreen extends StatelessWidget {
  //TODO criar a stream aqui
  //TODO passar os métodos para os botões
  //FIXME LEMBRAR DE FECHAR QUANDO ENCERRAR O WIDGET
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Selector<PomodoroSessionNotifier, PomodoroSessionStatus>(
            selector: (_, pomoNotifier) => pomoNotifier.pomodoroSessionStatus,
            builder: (_, pomoSessionStatus, child) {
              if (pomoSessionStatus == PomodoroSessionStatus.inProgress) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  PomodoroSessionProgressBar(),
                  PomodoroCircleWidget(),
                  PomodoroControllerMenu()
                ]);
              } else
                return PomodoroSessionFinishedPage();
            }),
      ),
    );
  }
}
