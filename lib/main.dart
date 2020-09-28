import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'alertDialog.dart';
import 'bottomNavigationBar.dart';
import 'bottomSheet.dart';
import 'drawer.dart';

void main() => runApp(MyApp());

class Notifier extends ValueNotifier<String> {
  Notifier() : super("(Please select menu)");

  void setMenu(String menutitle) => value = menutitle;
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  final _MenuItems = [
    'PopupMenuButton1',
    'PopupMenuButton2',
    'PopupMenuButton3'
  ];
  String _SelectedMenuItem = 'PopupMenuButton2';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Notifier>(
      create: (context) => Notifier(),
      child: MaterialApp(
        home: Scaffold(
          key: drawerKey,
          appBar: AppBar(
            title: Text('Side Menu example.'),
            actions: <Widget>[
              Consumer<Notifier>(
                builder: (contxt, notifier, _) => PopupMenuButton<String>(
                  initialValue: _SelectedMenuItem,
                  onSelected: (String s) {
                    _SelectedMenuItem = s;
                    notifier.value = "$s Selected";
                  },
                  itemBuilder: (BuildContext context) =>
                      _MenuItems.map((String s) => PopupMenuItem(
                            child: Text(s),
                            value: s,
                          )).toList(),
                ),
              )
            ],
          ),
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
                ),
                MyBottomSheetRaisedButton(),
                MyAlertDialogRaisedButton(),
              ],
            ),
          ),
          drawer: MyDrawer(),
          persistentFooterButtons: <Widget>[
            MyTextFlatButton(),
            MyIconButton(Icons.map, 'MapIcon tapped'),
            MyIconButton(Icons.mail, 'MailIcon tapped'),
          ],
          bottomNavigationBar: MyBottomNavigationBar(),
        ),
      ),
    );
  }
}

class MyAlertDialogRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => MyAlertDialog()),
      child: Text("Alert Dialog"),
    );
  }
}

class MyBottomSheetRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => showModalBottomSheet<void>(
          context: context, builder: (_) => MyBottomSheet()),
      child: Text("BottomSheet Open"),
    );
  }
}

class MyIconButton extends StatelessWidget {
  MyIconButton(this.icondata, this.pressedMessage);

  IconData icondata;
  String pressedMessage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icondata),
      onPressed: () =>
          Provider.of<Notifier>(context, listen: false).setMenu(pressedMessage),
    );
  }
}

class MyTextFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('FooterButton1'),
        onPressed: () => Provider.of<Notifier>(context, listen: false)
            .setMenu('FooterButton1 tapped'));
  }
}
