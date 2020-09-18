import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<CountData>.value(
        value : CountData(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetA_CounterText(),
                WidgetB_FixedText(),
                WidgetC_Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountData {
  CountData() {
    print("CountData constructor.");
  }

  Future<void> init() async {
    print("CountData init.");
  }

  int count = 0;

  void increment() => count++;

  Future<void> dispose() async {
    print("CountData dispose.");
  }
}

class WidgetA_CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text(
      '${Provider.of<CountData>(context).count}',
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
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return RaisedButton(
      onPressed: () => Provider.of<CountData>(context, listen: false).increment(),
      child: Text('Update Counter'),
    );
  }
}
