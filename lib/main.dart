import 'package:firstflutter/SampleRoute01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyEasyLocalizationStateless(),
  ));
}

class MyEasyLocalizationStateless extends StatelessWidget {
  const MyEasyLocalizationStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyLocalization',
      home: MyEasyLocalizationStateful(),
      routes: {
        '/sample': (context) => SampleRoute01(),
      },
    );
  }
}

class MyEasyLocalizationStateful extends StatefulWidget {
  const MyEasyLocalizationStateful({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyEasyLocalizationExampleState();
}

class _MyEasyLocalizationExampleState
    extends State<MyEasyLocalizationStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Android back press button'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sample');
                },
                child: Text('버튼'))
          ],
        ));
  }
}
