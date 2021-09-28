import 'package:firstflutter/SampleRoute01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyPageTransitionStateless(),
  ));
}

class MyPageTransitionStateless extends StatelessWidget {
  const MyPageTransitionStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page transition animation',
      home: MyPageTransitionStateful(),
    );
  }
}

class MyPageTransitionStateful extends StatefulWidget {
  const MyPageTransitionStateful({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageTransitionState();
}

class _MyPageTransitionState
    extends State<MyPageTransitionStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Page transition animation'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Text('버튼'))
          ],
        ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SampleRoute01(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
