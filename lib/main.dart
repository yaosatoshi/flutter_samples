import 'dart:convert';

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
            create: (context) => _Notifier(), child: MyHomePage()));
  }
}

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super("");

  void encode() {
    var data = {
      {'score': 40},
      [
        {'a': 40},
        {'b': 80},
        {'c': 100, 'overtime': true, 'special_guest': null}
      ]
    };
    value = jsonEncode(data);
  }

  void decode() {
    var jsonString = ''' [{"score":40},{"score":80}] ''';
    var output = "";

    List<dynamic> scores = jsonDecode(jsonString);
    var i = 0;
    scores.forEach((element) {
      output += "#${++i} : ${element['score']}\n";
    });
    value = output;
  }
}

class _MyDataSub {
  String stringDat;
  _MyDataSub(String sd) {
    stringDat = sd;
  }
  static
}

class _MyData {
  int intDat;
  String stringDat;
  List<int> intarrayDat;
  List<_MyDataSub> objectarrayDat;

  _MyData(int id, String sd, List<int> iad, List<_MyDataSub> oad) {
    intDat = id;
    stringDat = sd;
    intarrayDat = iad;
    objectarrayDat = oad;
  }
}


class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter JSON sample.")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).encode(),
                    child: Text('Encode'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).decode(),
                    child: Text('Decode'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(MyHomePage
                .of(context, listen: true)
                .value),
          ),
        ],
      ),
    );
  }
}
