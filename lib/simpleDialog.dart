import 'package:flutter/material.dart';

class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select account'),
      children: <Widget>[
        SimpleDialogOption(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade200,
              child: Text('A', style: TextStyle(color: Colors.black)),
            ),
            title: Text('First Column'),
          ),
          onPressed: () => Navigator.pop(context, "first"),
        ),
        SimpleDialogOption(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              child: Text('B', style: TextStyle(color: Colors.black)),
            ),
            title: Text('Second Column'),
          ),
          onPressed: () => Navigator.pop(context, "second"),
        ),
        SimpleDialogOption(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              child: Icon(Icons.add, color: Colors.white),
            ),
            title: Text('Third Column'),
          ),
          onPressed: () => Navigator.pop(context, "third"),
        ),
      ],
    );
  }
}
