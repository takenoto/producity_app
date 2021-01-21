import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/dimensions.dart';
import 'package:producity_app/presentation/screens/pomodoro_session_selector_screen.dart';
import 'package:producity_app/presentation/widgets/pomodoro_card.dart';
import 'package:provider/provider.dart';

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
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      debugPrint('TAP! @ ${this.runtimeType}');
                      Navigator.of(context)
                          .pushNamed(PomodoroSessionSelectorScreen.RouteName);
                    },
                    child: IgnorePointer(
                      ignoring: true,
                      child: PomodoroCard(
                        colorIsHighlight: true,
                        pomodoroSession:
                            Provider.of<PomodoroSessionNotifier>(context)
                                .pomodoroSession,
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
