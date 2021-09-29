import 'package:firstflutter/Count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final controller = Get.put(Count());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Study GetX'),
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
            icon: Icon(Icons.backup_table_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
              // ),
              Obx(() {
                return Text('Reactive way state: ${controller.rxNum.value}');
              }),
              TextButton(
                  onPressed: controller.incrementRxNum,
                  child: Text('incrementRx')),
            ],
          ),
        ));
  }
}
