import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

void main() => runApp(MyApp());

class Notifier extends ValueNotifier<String> {
  Notifier() : super("(Please select menu)");

  void setMenu(String menutitle) => value = menutitle;
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Notifier>(
        create: (context) => Notifier(),
        child: Scaffold(
          key: drawerKey,
          appBar: AppBar(title: Text('Side Menu example.')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Notifier>(
                    builder: (contxt, notifier, _) => Text('${notifier.value}',
                        style: Theme.of(context).textTheme.display1)),
                RaisedButton(
                  onPressed: () => drawerKey.currentState.openDrawer(),
                  child: Text("Drawer Open"),
                )
              ],
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}
