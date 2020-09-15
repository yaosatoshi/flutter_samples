import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super('');

  Future<void> init() async {
    value = await rootBundle.loadString('assets/txt/sampletext.txt');
  }

  AssetImage loadAssetImage() => AssetImage('assets/img/ic_launcher.png');
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = _Notifier();
    notifier.init();
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => notifier,
        child: _MyHomePage(),
      ),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<_Notifier>(context).value),
            Image(
                image: Provider.of<_Notifier>(context, listen: false)
                    .loadAssetImage()),
          ],
        ),
      ),
    );
  }
}
