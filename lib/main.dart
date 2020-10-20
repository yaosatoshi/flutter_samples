import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'myAlignPage.dart';
import 'myColumnPage.dart';
import 'myContainerPage.dart';
import 'myExpandPage.dart';
import 'myRowPage.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => _MyTopPage(),
          '/container': (_) => MyContainerPage(),
          '/align': (_) => MyAlignPage(),
          '/column': (_) => MyColumnPage(),
          '/row': (_) => MyRowPage(),
          '/expand': (_) => MyExpandPage(),
        },
      );
}

class _MyTopPage extends StatelessWidget {
  final _widgets = [
    _MyRaisedButton(buttonName: 'Container', transName: '/container'),
    _MyRaisedButton(buttonName: 'Alignment', transName: '/align'),
    _MyRaisedButton(buttonName: 'Column', transName: '/column'),
    _MyRaisedButton(buttonName: 'Row', transName: '/row'),
    _MyRaisedButton(buttonName: 'Expand', transName: '/expand'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Layout examples.')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: _widgets),
        ),
      );
}

class _MyRaisedButton extends StatelessWidget {
  _MyRaisedButton({Key key, this.buttonName, this.transName}) : super(key: key);

  final String transName;
  final String buttonName;

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Text(this.buttonName),
        onPressed: () => Navigator.pushNamed(context, this.transName),
      );
}

class MyBasePage extends StatelessWidget {
  MyBasePage({Key key, this.title, this.widgets}) : super(key: key);

  final String title;
  final Map<String, Widget> widgets;

  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[]..length = widgets.length;
    var i = 0;
    widgets.forEach((key, value) {
      buttons[i++] = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<_Notifier>(builder: (context, notifier, _) {
          return RaisedButton(
            child: Text(key),
            onPressed: () => notifier.setCurrentWidgetKey(key),
          );
        }),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: ChangeNotifierProvider<_Notifier>(
        create: (_) => _Notifier(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: buttons),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Consumer<_Notifier>(
                    builder: (context, notifier, _) {
                      if (notifier.currentkey != null) {
                        return widgets[notifier.currentkey];
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text("Please click any button.",
                              textScaleFactor: 2),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Notifier extends ChangeNotifier {
  String currentkey = null;

  void setCurrentWidgetKey(String key) {
    currentkey = key;
    notifyListeners();
  }
}
