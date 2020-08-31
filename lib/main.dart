import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
          create: (context) => _Notifier(), child: MyHomePage()),
    );
  }
}

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super("");

  int _counter = 0;

  void action() async {
    value = await getAsyncString();
  }

  Future<String> getAsyncString() async {
    var st = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(new Duration(seconds: 2));
    return "getAsyncString() called. ${++_counter} times. /delay:${DateTime.now().millisecondsSinceEpoch - st}ms";
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Future sample.")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).action(),
                    child: Text('Action'),
                  ),
                ),
              ),
            ],
          ),
          Text("${MyHomePage.of(context).value}")
        ],
      ),
    );
  }
}
