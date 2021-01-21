import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';

abstract class PomodoroControlNotification extends Notification {
  void action({@required PomodoroSessionNotifier sessionNotifier});
}

class PomodoroPauseNotification extends PomodoroControlNotification {
  @override
  void action({PomodoroSessionNotifier sessionNotifier}) {
    sessionNotifier.pauseSession();
  }
}

class PomodoroResumeNotification extends PomodoroControlNotification {
  @override
  void action({PomodoroSessionNotifier sessionNotifier}) {
    sessionNotifier.resumeSession();
  }
}

//ESSE É A AÇÃO DO CHECK, QUE É SKIP (PASSAR PRO PRÓXIMO)
class PomodoroCheckNotification extends PomodoroControlNotification {
  @override
  void action({PomodoroSessionNotifier sessionNotifier}) {
    sessionNotifier.nextPomo();
  }
}

//ENCERRA A SESSÃO ATUAL
class PomodoroEndSessionNotification extends PomodoroControlNotification {
  @override
  void action({PomodoroSessionNotifier sessionNotifier}) {
    sessionNotifier.endSession();
  }
}
