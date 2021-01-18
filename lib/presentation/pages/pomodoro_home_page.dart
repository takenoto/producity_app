import 'package:flutter/material.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/data/models/pomodoro.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';
import 'package:producity_app/presentation/screens/pomodoro_session_selector_screen.dart';
import 'package:producity_app/presentation/widgets/pomodoro_card.dart';

class PomodoroHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Text('25:00'),
        ),
        Positioned(
          bottom: 40,
          child: Column(
            children: [
              //TODO: Obter pomodoro atualmente selecionado pelo usuário dinamicamente
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('TAP! @ ${this.runtimeType}');
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PomodoroSessionSelectorScreen(),
                      ));
                    },
                    child: IgnorePointer(
                      ignoring: true,
                      child: PomodoroCard(
                        colorIsHighlight: true,
                        pomodoroSession: PomodoroSession(
                            name: 'Pomodoro Clássico',
                            pomodoros: [
                              Pomodoro(
                                  type: PomoType.work,
                                  totalDuration: Duration(minutes: 25)),
                              Pomodoro(
                                  type: PomoType.rest,
                                  totalDuration: Duration(minutes: 5)),
                              Pomodoro(
                                  type: PomoType.work,
                                  totalDuration: Duration(minutes: 25)),
                              Pomodoro(
                                  type: PomoType.rest,
                                  totalDuration: Duration(minutes: 5)),
                              Pomodoro(
                                  type: PomoType.bigRest,
                                  totalDuration: Duration(minutes: 25)),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
