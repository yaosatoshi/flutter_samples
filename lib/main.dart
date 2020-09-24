import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Future<String> _getFutureString() async {
    // throw Exception("error occured.");
    final st = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(Duration(seconds: 5));
    return 'Delay:${DateTime.now().millisecondsSinceEpoch - st}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureProvider<String>(
              create: (_) => _getFutureString(),
              catchError: (context, error) => "error occured.",
              child: Consumer<String>(
                builder: (context, value, _) => Text(value),
              ),
              initialData: "now loading..."),
        ),
      ),
    );
  }
}
