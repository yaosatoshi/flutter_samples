import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyRaisedButton extends StatelessWidget {
  MyRaisedButton(this.text, this.onPressed);

  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(text),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: onPressed);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int logcount = 0;
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
              MyRaisedButton("Log", () {
                Crashlytics.instance.log("clicked 'Log' button. ${++logcount} times.");
              }),
              MyRaisedButton(
                  "throw Exception", () => Crashlytics.instance.crash()),
              MyRaisedButton("Record Error", () {
                try {
                  throw Exception(
                      "Exception occured by 'Record Error' button.");
                } catch (e, s) {
                  Crashlytics.instance.recordError(e, s);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
