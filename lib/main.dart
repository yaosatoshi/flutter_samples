import 'package:flutter/material.dart';
import 'package:flutter_application/ToNativeAPI.dart';
import 'package:provider/provider.dart';

import 'ToNativeAPI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ChangeNotifierProvider(
            create: (context) => _Notifier(), child: MyHomePage()));
  }
}

class _Notifier extends ValueNotifier<String> {
  static const String InitialValue = "(Please push the button.)";

  final ToNativeAPI toNative = ToNativeAPI();

  _Notifier() : super(InitialValue);

  void voidMethodNoParam() async {
    await toNative.voidMethodNoParam();
    value = "voidMethodNoParam() finished.";
  }

  void getIntMethodNoParam() async {
    final ret = await toNative.getIntMethodNoParam();
    value = "getIntMethodNoParam() finished. /ret:$ret";
  }

  void getStringMethodParamsInt() async {
    final ret = await toNative.getStringMethodParamsInt(999);
    value = "getStringMethodParamsInt() finished. /ret:$ret";
  }

  void getIntArrayMethodParamsStringInt() async {
    final List<int> ret =
        await toNative.getIntArrayMethodParamsStringInt('ABC', 999);
    value = "getIntArrayMethodParamsStringInt() finished. /ret:$ret";
  }

  void getMapMethodNoParams() async {
    final Map<String, dynamic> ret = await toNative.getMapMethodNoParams();
    value = "getMapMethodNoParams() finished. /ret:$ret";
  }
}

class MyHomePage extends StatelessWidget {
  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Platform channel sample.")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${MyHomePage.of(context).value}"),
            Padding(padding: const EdgeInsets.all(8.0)),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => MyHomePage.of(context, listen: false)
                          .voidMethodNoParam(),
                      child: Text('voidMethodNoParam'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => MyHomePage.of(context, listen: false)
                          .getIntMethodNoParam(),
                      child: Text('getIntMethodNoParam'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => MyHomePage.of(context, listen: false)
                          .getStringMethodParamsInt(),
                      child: Text('getStringMethodParamsInt'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => MyHomePage.of(context, listen: false)
                          .getIntArrayMethodParamsStringInt(),
                      child: Text('getIntArrayMethodParamsStringInt'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => MyHomePage.of(context, listen: false)
                          .getMapMethodNoParams(),
                      child: Text('getMapMethodNoParams'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
