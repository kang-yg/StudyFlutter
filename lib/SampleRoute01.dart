import 'package:flutter/material.dart';

class SampleRoute01 extends StatelessWidget {
  const SampleRoute01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SampleRoute01Stateful();
  }
}

class SampleRoute01Stateful extends StatefulWidget {
  const SampleRoute01Stateful({Key? key}) : super(key: key);

  @override
  _SampleRoute01StatefulState createState() => _SampleRoute01StatefulState();
}

class _SampleRoute01StatefulState extends State<SampleRoute01Stateful> {
  var _str = 'ABC';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('Android back press button'),
            backgroundColor: Colors.greenAccent,
            leading: IconButton(
              icon: Icon(Icons.backup_table_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            color: Colors.greenAccent,
            child: Text(_str),
          ),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() {
    setState(() {
      _str = 'CBA';
    });
    return Future.value(false);
  }
}
