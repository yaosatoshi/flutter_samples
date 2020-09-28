import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {
            Provider.of<Notifier>(context, listen: false).value =
                'You selected Share';
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
          onTap: () {
            Provider.of<Notifier>(context, listen: false).value =
                'You selected Edit';
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete'),
          onTap: () {
            Provider.of<Notifier>(context, listen: false).value =
                'You selected Delete';
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
