import 'package:firstflutter/FirstPage.dart';
import 'package:firstflutter/Page1.dart';
import 'package:firstflutter/Page2.dart';
import 'package:firstflutter/Page3.dart';
import 'package:firstflutter/SecondPage.dart';
import 'package:flutter/material.dart';

final dummyItems = [
  'https://picsum.photos/id/237/200/300',
  'https://picsum.photos/seed/picsum/200/300',
  'https://picsum.photos/200/300?grayscale'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; // 페이지 인덱스
  var _pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('복잡한 UI', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.black,
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '이용서비스'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '내 정보'),
        ],
      ),
    );
  }
}
