import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Inherited(
        child: _Message(),
      ),
    );
  }
}

class _Inherited extends InheritedWidget {
  _Inherited({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  final String message = 'InheritedMessage';

  static _Inherited of(BuildContext context) {
    return context.getElementForInheritedWidgetOfExactType<_Inherited>().widget
        as _Inherited;
  }

  @override
  bool updateShouldNotify(_Inherited old) => false;
}

class _Message extends StatelessWidget {
  _Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${_Inherited.of(context).message}');
  }
}
