import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
          create: (context) => _Notifier(), child: MyHomePage()),
    );
  }
}

void _getAsyncStringIsolate(SendPort callerSendPort) {
  // Instantiate a SendPort to receive message from the caller.
  print("[sub] _getAsyncStringIsolate start.");
  final newIsolateReceivePort = ReceivePort();

  // (D) Provide the caller with the reference of THIS isolate's SendPort.
  callerSendPort.send(newIsolateReceivePort.sendPort);

  print("[sub] listen start.");
  // (E) Monitor messages from the main isolate.
  newIsolateReceivePort.listen((dynamic message) {
    // (G) Cast the retrieved message.
    CrossIsolatesMessage incomingMessage = message as CrossIsolatesMessage;
    print("[sub] incomingMessage received. /incomingMessage:$incomingMessage");

    // Process the message
    final st = DateTime.now().millisecondsSinceEpoch;
    sleep(Duration(seconds: 2));
    String newMessage =
        "incomingMessage received ${incomingMessage.message} times. /delay:${DateTime.now().millisecondsSinceEpoch - st}ms";

    // (J) Sends the outcome of the processing
    incomingMessage.sender.send(newMessage);
  });
  // (F) Note: listen() method returns immediately.
  print("[sub] _getAsyncStringIsolate end.");
}

// Helper class
class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;

  CrossIsolatesMessage({
    @required this.sender,
    this.message,
  });
}

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super("");

  int _counter = 0;

  Isolate newIsolate;
  SendPort newIsolateSendPort;

  void start() async {
    // (A) Local and temporary ReceivePort to retrieve the new isolate's SendPort.
    final receivePort = ReceivePort();

    // (B) Instantiate the new isolate.
    newIsolate =
        await Isolate.spawn(_getAsyncStringIsolate, receivePort.sendPort);

    // (C) Retrieve the port to be used for further communication.
    newIsolateSendPort = await receivePort.first;
    _counter = 0;
    value = 'Isolate started.';
  }

  void stop() {
    newIsolate?.kill(priority: Isolate.immediate);
    newIsolate = null;
    value = 'Isolate stopped.';
  }

  void action() async {
    value = await _sendAndReceiveAnswer("${(++_counter).toString()}");
  }

  Future<String> _sendAndReceiveAnswer(String messageToBeSent) async {
    // We create a temporary port to receive the answer
    ReceivePort port = ReceivePort();

    // (H) We send the message to the Isolate, and also tell the isolate which port to use to provide any answer.
    newIsolateSendPort.send(CrossIsolatesMessage<String>(
      sender: port.sendPort,
      message: messageToBeSent,
    ));

    // (I) Wait for the answer and return it
    return await port.first;
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Isolate sample.")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).start(),
                    child: Text('①常駐開始'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).action(),
                    child: Text('②Action'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).stop(),
                    child: Text('③常駐終了'),
                  ),
                ),
              ),
            ],
          ),
          Text("${MyHomePage.of(context).value}")
        ],
      ),
    );
  }
}
