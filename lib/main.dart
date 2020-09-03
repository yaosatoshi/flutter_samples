import 'dart:convert';

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

class _MyDataSub2 {
  final double my2doubleDat;
  final BigInt my2bintDat;

  _MyDataSub2(double dd, BigInt bid)
      : my2doubleDat = dd,
        my2bintDat = bid;

  String log() =>
      "_MyDataSub2(/my2doubleDat:$my2doubleDat /my2bintDat:$my2bintDat)";

  Map<String, dynamic> toJson() =>
      {'my2doubleDat': my2doubleDat, 'my2bintDat': my2bintDat.toString()};

  static _MyDataSub2 fromJson(Map<String, dynamic> json) => _MyDataSub2(
      json['my2doubleDat'] as double,
      BigInt.parse(json['my2bintDat'] as String));
}

class _MyDataSub1 {
  final String my1stringDat;
  final bool my1boolDat;

  _MyDataSub1(String sd, bool bd)
      : my1stringDat = sd,
        my1boolDat = bd;

  String log() =>
      "_MyDataSub1(/my1stringDat:$my1stringDat　/my1boolDat:$my1boolDat)";

  Map<String, dynamic> toJson() =>
      {'my1stringDat': my1stringDat, 'my1boolDat': my1boolDat};

  static _MyDataSub1 fromJson(Map<String, dynamic> json) =>
      _MyDataSub1(json['my1stringDat'], json['my1boolDat']);
}

class _MyData {
  final int intDat;
  final String stringDat;
  final List<int> intListDat;
  final List<String> stringListDat;
  final _MyDataSub1 my1Dat;
  final List<_MyDataSub2> my2ListDat;

  _MyData(int id, String sd, List<int> ild, List<String> sld, _MyDataSub1 my1d,
      List<_MyDataSub2> my2ld)
      : intDat = id,
        stringDat = sd,
        intListDat = ild,
        stringListDat = sld,
        my1Dat = my1d,
        my2ListDat = my2ld;

  String log() {
    String my2ListLog = "[";
    my2ListDat.map((item) => my2ListLog += "${item.log()},");
    my2ListLog += "]";
    return "_MyData(/intDat:$intDat /stringDat:$stringDat /intListDat:$intListDat /stringListDat:$stringListDat /my1Dat:${my1Dat.log()} /my2ListDat:$my2ListLog)";
  }

  Map<String, dynamic> toJson() => {
        'intDat': intDat,
        'stringDat': stringDat,
        'intListDat': intListDat,
        'stringListDat': stringListDat,
        'my1Dat': my1Dat.toJson(),
        'my2ListDat': my2ListDat.map((item) => item.toJson()).toList()
      };

  String toJsonString() => jsonEncode(toJson());

  static _MyData fromJson(Map<String, dynamic> json) => _MyData(
      json['intDat'],
      json['stringDat'],
      json['intListDat'].cast<int>(),
      json['stringListDat'].cast<String>(),
      _MyDataSub1.fromJson(json['my1Dat']),
      json['my2ListDat']
          .map((item) => _MyDataSub2.fromJson(item))
          .toList()
          .cast<_MyDataSub2>());

  static _MyData fromJsonString(String jsonString) =>
      fromJson(jsonDecode(jsonString));
}

class _Notifier extends ValueNotifier<String> {
  final _MyData sampleData = _MyData(
      500,
      "STRING",
      [0, 1, 2, 3, 4],
      ["A", "B", "C"],
      _MyDataSub1("Sub1", true),
      [
        _MyDataSub2(0.7, BigInt.from(4000)),
        _MyDataSub2(1.4, BigInt.from(8000)),
        _MyDataSub2(2.1, BigInt.from(12000))
      ]);

  //String get sampleJsonString => sampleData.toJsonString();
  String get sampleJsonString => '{"intDat":500,"stringDat":"STRING","intListDat":[0,1,2,3,4],"stringListDat":["A","B","C"],"my1Dat":{"my1stringDat":"Sub1","my1boolDat":true},"my2ListDat":[{"my2doubleDat":0.7,"my2bintDat":"4000"},{"my2doubleDat":1.4,"my2bintDat":"8000"},{"my2doubleDat":2.1,"my2bintDat":"12000"}]}';

  _Notifier() : super("");

  // _MyData to jsonString.
  void encode() {
    value = sampleData.toJsonString();
  }

  // jsonString to _MyData.
  void decode() {
    value = _MyData.fromJsonString(sampleJsonString).log();
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
