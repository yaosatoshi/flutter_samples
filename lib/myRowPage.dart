import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyRowPage extends StatelessWidget {
  final _widgets = {
    "1.Basic": _RowBasic(),
    "2.WrapWidth": _RowWrapWidth(),
    "3.AlignHeight": _RowAlignHeight(),
    "4.AlignWidth": _RowAlignWidth(),
    "5.ManyItems": _RowManyItems(),
    "6.ManyItems2": _RowManyItems2(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Row examples", widgets: _widgets);
}

class _RowBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          children: [
            const Text("Row First", textScaleFactor: 2),
            const Text("Row Second", textScaleFactor: 2)
          ],
        ),
      );
}

class _RowWrapWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Row First", textScaleFactor: 2),
            const Text("Row Second", textScaleFactor: 2)
          ],
        ),
      );
}

class _RowAlignHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 300,
        color: Colors.green,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Row First", textScaleFactor: 2),
            const Text("Row Second", textScaleFactor: 2)
          ],
        ),
      );
}

class _RowAlignWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Row First", textScaleFactor: 2),
            const Text("Row Second", textScaleFactor: 2)
          ],
        ),
      );
}

class _RowManyItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = List<Widget>(100);
    for (int i = 0; i < 100; i++) {
      rows[i] = Text("Row $i", textScaleFactor: 2);
    }
    return Container(
      color: Colors.green,
      child: Row(children: rows),
    );
  }
}

class _RowManyItems2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = List<Widget>(100);
    for (int i = 0; i < 100; i++) {
      rows[i] = Text("Row $i", textScaleFactor: 2);
    }
    return Container(
      color: Colors.green,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: rows),
      ),
    );
  }
}
