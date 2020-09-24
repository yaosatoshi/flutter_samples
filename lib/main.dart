import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int count = 0;

  Future<String> _getFutureString() async {
//    throw Exception("");
    final st = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(Duration(seconds: 5));
    return 'Count:${++count} Delay:${DateTime.now().millisecondsSinceEpoch - st}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<String>(
              future: _getFutureString(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error occured.");
                } else {
                  print("data:${snapshot.data}");
                  return Text(snapshot.data);
                }
              },
              initialData: "now loading..."),
        ),
      ),
    );
  }
}
