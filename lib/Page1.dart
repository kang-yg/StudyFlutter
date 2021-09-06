import 'package:firstflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[_buildTop(), _buildMiddle(), _buildBottom()],
    );
  }

  Widget _buildTop() {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Column(
                      children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                    )),
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                ),
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                ),
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                ),
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                ),
                Column(
                  children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                ),
                Opacity(
                  opacity: 0.0,
                  child: Column(
                    children: <Widget>[Icon(Icons.local_taxi), Text('택시')],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(height: 150, autoPlay: true),
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print(url);
                    },
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(
        10,
        (index) => ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('[이벤트] 이것은 공지사항입니다.')));
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}

