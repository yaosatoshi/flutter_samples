import 'package:flutter/material.dart';
import 'package:flutter_application/nextpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyTopPage(),
        '/nextPage': (context) => MyNextPage(),
      }
    );
  }
}

class MyTopPage extends StatelessWidget {
  MyTopPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen transition example.')),
      body: Center(child: const Text('Main Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/nextPage");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
