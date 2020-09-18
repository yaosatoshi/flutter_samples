import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenableProvider<_Notifier>(
        create: (_) {
          final notifier = _Notifier();
          notifier.init();
          return notifier;
        },
        dispose: (_, notifier) async => await notifier.dispose(),
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

class _Notifier extends ChangeNotifier {
  int value = 0;

  Future<void> init() async {
    print("_Notifier init.");
  }

  @override
  void dispose() async {
    super.dispose();
    print("_Notifier dispose.");
  }

  void increment() {
    value++;
    notifyListeners();
  }
}

class WidgetA_CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text(
      '${Provider.of<_Notifier>(context).value}',
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
      onPressed: () =>
          Provider.of<_Notifier>(context, listen: false).increment(),
      child: Text('Update Counter'),
    );
  }
}
