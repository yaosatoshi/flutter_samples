import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyExpandPage extends StatelessWidget {
  final _widgets = {
    "1.Column": _ExpandColumnBasic(),
    "2.ColumnMulti": _ExpandColumnMulti(),
    "3.ColumnMulti2": _ExpandColumnMulti2(),
    "4.Row": _ExpandRowBasic(),
    "5.RowMulti": _ExpandRowMulti(),
    "6.RowMulti2": _ExpandRowMulti2(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Expand examples", widgets: _widgets);
}

class _ExpandColumnBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
      );
}

class _ExpandColumnMulti extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2-1")),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2-2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
      );
}

class _ExpandColumnMulti2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(
                flex: 5,
                child: _ColorText(color: Colors.yellow, text: "Text2-1")),
            Expanded(
                flex: 2,
                child: _ColorText(color: Colors.yellow, text: "Text2-2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
      );
}

class _ExpandRowBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
      );
}

class _ExpandRowMulti extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2-1")),
            Expanded(child: _ColorText(color: Colors.yellow, text: "Text2-2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
      );
}

class _ExpandRowMulti2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          children: [
            _ColorText(color: Colors.red, text: "Text1"),
            Expanded(
                flex: 5,
                child: _ColorText(color: Colors.yellow, text: "Text2-1")),
            Expanded(
                flex: 2,
                child: _ColorText(color: Colors.yellow, text: "Text2-2")),
            _ColorText(color: Colors.red, text: "Text3"),
          ],
        ),
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
