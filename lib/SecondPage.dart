import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecondPage',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MySecondPage(),
    );
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Container(color: Colors.deepPurple),
    );
  }
}
