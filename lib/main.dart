import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crashlytics Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Flutter Crashlytics Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("throw Exception"),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  print("throw exception");
                  Crashlytics.instance.crash();
                },
              ),
              RaisedButton(
                child: Text("log"),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  print("log");
                  Crashlytics.instance.crash();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
