import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CarouseSliderExample()));

class CarouseSliderExample extends StatefulWidget {
  const CarouseSliderExample({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarouseSliderExampleState();
}

class _CarouseSliderExampleState extends State<CarouseSliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'CarouseSliderExample',
            textAlign: TextAlign.left,
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: CarouselSlider(
            items: items,
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            )
        ));
  }

  Widget _getPage(var index) {
    var result;

    switch (index) {
      case 1:
        result = _firstPage();
        break;
      case 2:
        result = _secondPage();
        break;

      default:
        result = _elsePage();
        break;
    }

    return result;
  }

  Widget _firstPage() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.amber),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print('AAA');
                },
                child: Text('Button')),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  30,
                  (index) => ListTile(
                        title: Text('$index'),
                      )),
            )
          ],
        ));
  }

  Widget _secondPage() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print('AAA');
                },
                child: Text('Button')),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  30,
                  (index) => ListTile(
                        title: Text('$index'),
                      )),
            )
          ],
        ));
  }

  Widget _elsePage() {
    return Center(
      child: Text('else page'),
    );
  }
}
