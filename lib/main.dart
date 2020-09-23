import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = _Notifier();
    return MaterialApp(
      home: ValueListenableProvider<int>(
        create: (_) {
          counter.init();
          return counter;
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetA_CounterText(),
                WidgetB_FixedText(),
                RaisedButton(
                  onPressed: () => counter.increment(),
                  child: Text('Update Counter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Notifier extends ValueNotifier<int> {
  _Notifier() : super(0);

  Future<void> init() async {
    print("CountData init.");
  }

  void increment() => value++;

  @override
  void dispose() {
    super.dispose();
    print("CountData dispose.");
  }
}

class WidgetA_CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text(
      '${Provider.of<int>(context)}',
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
