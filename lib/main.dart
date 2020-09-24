import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<_Notifier>(create: (context) => _Notifier()),
          ChangeNotifierProvider<_Notifier2>(create: (context) => _Notifier2()),
        ],
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

class _Notifier extends ValueNotifier<int> {
  _Notifier() : super(0);

  void increment() => value++;
}

class _Notifier2 extends ValueNotifier<int> {
  _Notifier2() : super(0);

  void increment() => value += 10;
}

class WidgetA_CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text(
      '${Provider.of<_Notifier>(context).value} ${Provider.of<_Notifier2>(context).value}',
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
      onPressed: () {
        Provider.of<_Notifier>(context, listen: false).increment();
        Provider.of<_Notifier2>(context, listen: false).increment();
      },
      child: Text('Update Counter'),
    );
  }
}
