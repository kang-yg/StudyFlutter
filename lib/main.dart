import 'package:firstflutter/SampleRoute01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Count.dart';

void main() {
  runApp(MaterialApp(
    home: StudyGetXStateless(),
  ));
}

class StudyGetXStateless extends StatelessWidget {
  const StudyGetXStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Study GetX',
      home: StudyGetXStateful(),
      getPages: [
        GetPage(name: '/Sample01', page: () => SampleRoute01()),
      ],
    );
  }
}

class StudyGetXStateful extends StatefulWidget {
  const StudyGetXStateful({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StudyGetXSState();
}

class _StudyGetXSState extends State<StudyGetXStateful> {
  final controller = Get.put(Count());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study GetX'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              child: Text('버튼'),
              onPressed: () {
                Get.to(SampleRoute01());
              },
            ),
            GetBuilder<Count>(
                builder: (_) =>
                    Text('Simple way state: ${controller.simpleNum}')),
            TextButton(
                onPressed: controller.incrementSimpleNum,
                child: Text('incrementSimple')),
            SizedBox(
              height: 30,
            ),
            // GetX<Count>(
            //   builder: (_) =>
            //       Text('Reactive way state: ${controller.rxNum.value}'),
            // )
            Obx(() {
              return Text('Reactive way state: ${controller.rxNum.value}');
            }),
            TextButton(
                onPressed: controller.incrementRxNum,
                child: Text('incrementRx')),
          ],
        ),
      ),
    );
  }
}
