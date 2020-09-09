import 'package:flutter/material.dart';
import 'package:flutter_application/httpAccess.dart';
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

  final HttpAccess http = HttpAccess();
  List<String> listdata = [];

  List<String> getData() => listdata;

  void httpGet() async {
    final body = await http.get();
    listdata = body.split("\n");
    value = body;
  }

  void httpPut() async {
    final body = await http.put();
    listdata = body.split("\n");
    value = body;
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter HTTP in Dart sample.")),
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
                        MyHomePage.of(context, listen: false).httpGet(),
                    child: Text('Get'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).httpPut(),
                    child: Text('Put'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: MyHomePage.of(context, listen: true).getData().length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                      MyHomePage.of(context, listen: false).getData()[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
