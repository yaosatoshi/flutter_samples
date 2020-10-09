import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyAlignPage extends StatelessWidget {
  final _widgets = {
    "1.Center1": _AlignCenter(),
    "2.Center2": _AlignCenter2(),
    "3.BottomRight": _AlignBottomRight(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Alignment examples", widgets: _widgets);
}

class _AlignCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: const Text("Child Text", textScaleFactor: 2),
      );
}

class _AlignCenter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Center(child: const Text("Child Text", textScaleFactor: 2));
}

class _AlignBottomRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text("Child Text", textScaleFactor: 2),
      ));
}
