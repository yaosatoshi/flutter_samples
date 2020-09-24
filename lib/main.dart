import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class _Notifier extends ValueNotifier<int> {
  _Notifier() : super(0);

  void tapped() => value++;
}

class _Notifier2 extends ValueNotifier<String> {
  _Notifier2() : super("");

  void setCount(int count) => value = 'Count is $count';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<_Notifier>(create: (context) => _Notifier()),
        ChangeNotifierProxyProvider<_Notifier, _Notifier2>(
          create: (context) => _Notifier2(),
          update: (context, notifier1, notifier2) {
            print("ProxyProvider update called.");
            notifier2.setCount(notifier1.value);
            return notifier2;
          },
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Consumer<_Notifier>(
              builder: (context, n1, _) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("[Notifier1]: ${n1.value}"),
                  Consumer<_Notifier2>(
                      builder: (context, n2, _) =>
                          Text("[Notifier2]: ${n2.value}")),
                  RaisedButton(
                      onPressed: () => n1.tapped(),
                      child: Text("Update Counter")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
