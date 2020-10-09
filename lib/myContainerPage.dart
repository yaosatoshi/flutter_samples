import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyContainerPage extends StatelessWidget {
  final _widgets = {
    "1.Fix": _ContainerFix(),
    "2.Infinity": _ContainerInfinity(),
    "3.WrapChild": _ContainerWrapChild(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Container examples", widgets: _widgets);
}

class _ContainerFix extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 200,
        height: 200,
        color: Colors.green,
      );
}

class _ContainerInfinity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
      );
}

class _ContainerWrapChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text("Child Text", textScaleFactor: 2),
        ),
      );
}
