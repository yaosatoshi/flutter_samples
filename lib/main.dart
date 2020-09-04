import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Storage.dart';

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
  static const String InitialValue = "(Not yet...)";

  _Notifier() : super(InitialValue);
  var _storedString = InitialValue;

  set storedString(String val) => _storedString = val;

  String get storedString => _storedString;

  final MyStorage storage = MyStorage();
  final textEditingController = TextEditingController(text: InitialValue);

  void save() => storage.save(storedString);

  Future<String> load() async {
    textEditingController.text = storedString = await storage.load();
    value = storedString;
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Shared Preference sample.")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).save(),
                    child: Text('Save'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).load(),
                    child: Text('Load'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextFormField(
              controller: MyHomePage.of(context).textEditingController,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Please enter the text.'),
              onChanged: (changedText) {
                MyHomePage.of(context, listen: false).storedString =
                    changedText;
              },
            ),
          ),
        ],
      ),
    );
  }
}
