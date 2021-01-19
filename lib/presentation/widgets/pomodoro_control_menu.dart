import 'package:flutter/material.dart';

class PomodoroControllerMenu extends StatelessWidget {
  //TODO: Adicionar os ícones
  //TODO: os métodos devem ser passados por quem criar o widget pra ficar mais fácil já que ele vai controlar uma stream

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          FlatButton.icon(
              onPressed: () {}, icon: Icon(Icons.check), label: null),
          _PlayAndPauseButton(),
          FlatButton.icon(
              onPressed: () {}, icon: Icon(Icons.stop), label: null),
        ],
      ),
    );
  }
}

class _PlayAndPauseButton extends StatefulWidget {
  @override
  __PlayAndPauseButtonState createState() => __PlayAndPauseButtonState();
}

class __PlayAndPauseButtonState extends State<_PlayAndPauseButton> {
  @override
  Widget build(BuildContext context) {
    //TODO: Fazer ele trocar de play para pause e vice-versa quando for pressionado
    return FlatButton.icon(
        onPressed: () {}, icon: Icon(Icons.play_arrow), label: null);
  }
}
