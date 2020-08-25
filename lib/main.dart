import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(child: new MyStatelessWidget()),
  );
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text('3-1-2 Stateless Widget sample',
        textDirection: TextDirection.ltr);
  }
}
