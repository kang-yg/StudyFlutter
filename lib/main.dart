import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: MyEasyLocalizationStateless(),
    supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR')],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
  ));
}

class MyEasyLocalizationStateless extends StatelessWidget {
  const MyEasyLocalizationStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyLocalization',
      home: MyEasyLocalizationStateful(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
          title: Text('EasyLocalization'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(child: Column(children: <Widget>[Text('hello').tr()])));
  }
}
