import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Use camera?'),
      content: Text('Description goes here.'),
      actions: <Widget>[
        FlatButton(
            child: Text('CANCEL'),
            onPressed: () {
              Provider.of<Notifier>(context, listen: false).value =
                  "clicked AlertDialog CANCEL.";
              Navigator.pop(context);
            }),
        FlatButton(
            child: Text('AGREE'),
            onPressed: () {
              Provider.of<Notifier>(context, listen: false).value =
                  "clicked AlertDialog AGREE.";
              Navigator.pop(context);
            }),
      ],
    );
  }
}
