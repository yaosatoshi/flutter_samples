import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetA_CounterText(_counter),
            WidgetB_FixedText(),
            WidgetC_Button(_incrementCounter),
          ],
        ),
      ),
    );
  }
}

class WidgetA_CounterText extends StatelessWidget {
  final int counter;

  WidgetA_CounterText(this.counter);

  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return  Text(
        '${counter}',
        style: Theme.of(context).textTheme.display1,
    );
  }
}

class WidgetB_FixedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text('FIXED TEXT');
  }
}

class WidgetC_Button extends StatelessWidget {
  final void Function() incrementCounter;

  WidgetC_Button(this.incrementCounter);

  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return RaisedButton(
      onPressed: () {
        incrementCounter();
      },
      child: Text('Update Counter'),
    );
  }
}
