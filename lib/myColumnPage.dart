import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyColumnPage extends StatelessWidget {
  final _widgets = {
    "1.Basic": _ColumnBasic(),
    "2.WrapHeight": _ColumnWrapHeight(),
    "3.AlignWidth": _ColumnAlignWidth(),
    "4.AlignHeight": _ColumnAlignHeight(),
    "5.ManyItems": _ColumnManyItems(),
    "6.ManyItems2": _ColumnManyItems2(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Column examples", widgets: _widgets);
}

class _ColumnBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          children: [
            const Text("Column First", textScaleFactor: 2),
            const Text("Column Second", textScaleFactor: 2),
            const Text("Column Third", textScaleFactor: 2)
          ],
        ),
      );
}

class _ColumnWrapHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Column First", textScaleFactor: 2),
            const Text("Column Second", textScaleFactor: 2),
            const Text("Column Third", textScaleFactor: 2)
          ],
        ),
      );
}

class _ColumnAlignWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Column First", textScaleFactor: 2),
            const Text("Column Second", textScaleFactor: 2),
            const Text("Column Third", textScaleFactor: 2)
          ],
        ),
      );
}

class _ColumnAlignHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Column First", textScaleFactor: 2),
            const Text("Column Second", textScaleFactor: 2),
            const Text("Column Third", textScaleFactor: 2)
          ],
        ),
      );
}

class _ColumnManyItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final columns = List<Widget>(100);
    for (int i = 0; i < 100; i++) {
      columns[i] = Text("Column $i", textScaleFactor: 2);
    }
    return Container(
      color: Colors.green,
      child: Column(children: columns),
    );
  }
}

class _ColumnManyItems2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final columns = List<Widget>(100);
    for (int i = 0; i < 100; i++) {
      columns[i] = Text("Column $i", textScaleFactor: 2);
    }
    return Container(
      color: Colors.green,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: columns),
      ),
    );
  }
}
