import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyStackPage extends StatelessWidget {
  final _widgets = {
    "1.Basic": _StackBasic(),
    "2.Alignment": _StackAlignment(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Stack examples", widgets: _widgets);
}

class _StackBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          _ColorText(color: Colors.red, text: "ABCDEFG"),
          _ColorText(color: Colors.yellow, text: "HIJ"),
        ],
      );
}

class _StackAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 300, height: 300, color: Colors.red),
          Container(width: 100, height: 100, color: Colors.yellow),
        ],
      );
}

class _ColorText extends StatelessWidget {
  _ColorText({Key key, this.color, this.text}) : super(key: key);

  Color color;
  String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Text(text, textScaleFactor: 2),
        ),
      );
}
