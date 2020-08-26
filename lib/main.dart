import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key key}) : super(key: key);

  final String message = "HomePage";

  @override
  Widget build(BuildContext context) {
    return _Message();
  }

  static _HomePage of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<_HomePage>();
  }
}

class _Message extends StatelessWidget {
  const _Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Message: ${_HomePage.of(context).message}',
      style: const TextStyle(fontSize: 96),
    );
  }
}
