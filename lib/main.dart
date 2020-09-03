import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyData.dart';
import 'MyDataSub1.dart';
import 'MyDataSub2.dart';

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

//@JsonSerializable()

class _Notifier extends ValueNotifier<String> {
  final MyData sampleData = MyData(
      500,
      "STRING",
      [0, 1, 2, 3, 4],
      ["A", "B", "C"],
      MyDataSub1("Sub1", true),
      [
        MyDataSub2(0.7, BigInt.from(4000)),
        MyDataSub2(1.4, BigInt.from(8000)),
        MyDataSub2(2.1, BigInt.from(12000))
      ]);

  //String get sampleJsonString => sampleData.toJsonString();
  String get sampleJsonString =>
      '{"intDat":500,"stringDat":"STRING","intListDat":[0,1,2,3,4],"stringListDat":["A","B","C"],"my1Dat":{"my1stringDat":"Sub1","my1boolDat":true},"my2ListDat":[{"my2doubleDat":0.7,"my2bintDat":"4000"},{"my2doubleDat":1.4,"my2bintDat":"8000"},{"my2doubleDat":2.1,"my2bintDat":"12000"}]}';

  _Notifier() : super("");

  // _MyData to jsonString.
  void encode() {
    value = sampleData.toJsonString();
  }

  // jsonString to _MyData.
  void decode() {
    value = MyData.fromJsonString(sampleJsonString).log();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MyHomePage.of(context, listen: true).value),
          ),
        ],
      ),
    );
  }
}
