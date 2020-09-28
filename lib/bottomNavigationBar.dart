import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final nameButtons = ['Contacts', 'Map', 'Chat'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (contxt, notifier, _) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text(nameButtons[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text(nameButtons[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text(nameButtons[2])),
        ],
        onTap: (int index) {
          currentIndex = index;
          notifier.value =
              'BottomNavigationBar ${nameButtons[index]} tapped. /idx:$index';
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
