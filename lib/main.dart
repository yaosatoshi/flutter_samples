import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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

  List<String> listdata = [];
  List<String> getData() => listdata;

  void httpGet() {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    print("httpGet called. /url:$url");
    http.get(url).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      listdata = response.body.split("\n");
      value = response.body;
    });
  }

  void httpPut() {
    const url = 'https://httpbin.org/put';
    print("httpPut called. /url:$url");
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = '{"name":"FlutterSample"}';
    http.put(url, headers: headers, body: body).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      listdata = response.body.split("\n");
      value = response.body;
    });
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
