import 'package:flutter/material.dart';

class PomodoroSessionSelectorScreen extends StatelessWidget {
  static const String RouteName = 'POMODOROSESSIONSELECTORSCREEN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor, elevation: 0),
        body: SizedBox.expand(
            child: Center(
          child: Text('${this.runtimeType}'),
        )));
  }
}
