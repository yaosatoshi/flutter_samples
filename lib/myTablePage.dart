import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class MyTablePage extends StatelessWidget {
  final _widgets = {
    "1.Basic": _TableBasic(),
    "2.V-Alignment": _TableVerticalAlignment(),
    "3.FlexColumnWidth": _TableFlexColumnWidth(),
    "4.IntrinsicColumnWidth": _TableIntrinsicColumnWidth(),
    "5.ColumnWidths": _TableColumnWidths(),
    "6.GridView": _TableGridView(),
  };

  @override
  Widget build(BuildContext context) =>
      MyBasePage(title: "Table examples", widgets: _widgets);
}

class _TableBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Table(
          children: [
            TableRow(children: [
              _ColorText(color: Colors.red, text: "1-1\none-\none"),
              _ColorText(color: Colors.red, text: "1-2.one-two"),
              _ColorText(color: Colors.red, text: "1-3.one-three"),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.blue, text: "2-1"),
              _ColorText(color: Colors.blue, text: "2-2.two-two"),
              _ColorText(color: Colors.blue, text: "2-3.two-three"),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.yellow, text: "3-1"),
              _ColorText(color: Colors.yellow, text: "3-2.three-two"),
              _ColorText(color: Colors.yellow, text: "3-3.three-three"),
            ]),
          ],
        ),
      );
}

class _TableVerticalAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          children: [
            TableRow(children: [
              _ColorText(color: Colors.red, text: "1-1\none-\none"),
              _ColorText(color: Colors.red, text: "1-2.one-two"),
              _ColorText(color: Colors.red, text: "1-3.one-three"),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.blue, text: "2-1"),
              _ColorText(color: Colors.blue, text: "2-2.two-two"),
              _ColorText(color: Colors.blue, text: "2-3.two-three"),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.yellow, text: "3-1"),
              _ColorText(color: Colors.yellow, text: "3-2.three-two"),
              _ColorText(color: Colors.yellow, text: "3-3.three-three"),
            ]),
          ],
        ),
      );
}

class _TableFlexColumnWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Table(
          defaultColumnWidth: FlexColumnWidth(.5),
          children: [
            TableRow(children: [
              _ColorText(color: Colors.red, text: "1-1\none-\none"),
              _ColorText(color: Colors.red, text: "1-2.one-two"),
              _ColorText(color: Colors.red, text: "1-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.blue, text: "2-1"),
              _ColorText(color: Colors.blue, text: "2-2.two-two"),
              _ColorText(color: Colors.blue, text: "2-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.yellow, text: "3-1"),
              _ColorText(color: Colors.yellow, text: "3-2.three-two"),
              _ColorText(color: Colors.yellow, text: "3-3."),
            ]),
          ],
        ),
      );
}

class _TableIntrinsicColumnWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Table(
          defaultColumnWidth: IntrinsicColumnWidth(),
          children: [
            TableRow(children: [
              _ColorText(color: Colors.red, text: "1-1\none-\none"),
              _ColorText(color: Colors.red, text: "1-2.one-two"),
              _ColorText(color: Colors.red, text: "1-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.blue, text: "2-1"),
              _ColorText(color: Colors.blue, text: "2-2.two-two"),
              _ColorText(color: Colors.blue, text: "2-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.yellow, text: "3-1"),
              _ColorText(color: Colors.yellow, text: "3-2.three-two"),
              _ColorText(color: Colors.yellow, text: "3-3."),
            ]),
          ],
        ),
      );
}

class _TableColumnWidths extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: Table(
          columnWidths: {0: IntrinsicColumnWidth(), 1: FlexColumnWidth(2)},
          children: [
            TableRow(children: [
              _ColorText(color: Colors.red, text: "1-1\none-\none"),
              _ColorText(color: Colors.red, text: "1-2.one-two"),
              _ColorText(color: Colors.red, text: "1-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.blue, text: "2-1"),
              _ColorText(color: Colors.blue, text: "2-2.two-two"),
              _ColorText(color: Colors.blue, text: "2-3."),
            ]),
            TableRow(children: [
              _ColorText(color: Colors.yellow, text: "3-1"),
              _ColorText(color: Colors.yellow, text: "3-2.three-two"),
              _ColorText(color: Colors.yellow, text: "3-3."),
            ]),
          ],
        ),
      );
}

class _TableGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridMaxCount = 20;
    return Container(
      color: Colors.green,
      child: GridView.builder(
          itemCount: gridMaxCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index < gridMaxCount) {
              return Center(
                child: _ColorText(color: Colors.yellow, text: "Cell #$index"),
              );
            } else {
              return null;
            }
          }),
    );
  }
}

class _ColorText extends StatelessWidget {
  _ColorText({Key key, this.color, this.text}) : super(key: key);

  Color color;
  String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Text(text, textScaleFactor: 2),
        ),
      );
}
