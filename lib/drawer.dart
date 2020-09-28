import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<Notifier>(context, listen: false);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'SideMenu',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Menu1'),
            onTap: () {
              notifier.setMenu('Menu1 selected');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Menu2'),
            onTap: () {
              notifier.setMenu('Menu2 selected');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Menu3'),
            onTap: () {
              notifier.setMenu('Menu3 selected');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Menu4'),
            onTap: () {
              notifier.setMenu('Menu4 selected');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Menu5'),
            onTap: () {
              notifier.setMenu('Menu5 selected');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
