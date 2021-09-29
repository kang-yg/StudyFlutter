import 'package:get/get.dart';

class Count extends GetxController {
  var simpleNum = 0;
  var rxNum = 0.obs;

  @override
  void onInit() {
    super.onInit();

    once(rxNum, (_) {
      print('$_이 처음으료 변경되었습니다.');
    });

    ever(rxNum, (_) {
      print('$_이 변경되었습니다.');
    });

    debounce(rxNum, (_) {
      print('$_이 변경된 후 1초간 변경이 없습니다.');
    }, time: Duration(seconds: 1));

    interval(rxNum, (_) {
      print('$_가 변경되는 중입니다.(1초마다 호출)');
    }, time: Duration(seconds: 1));
  }

  void incrementSimpleNum() {
    simpleNum++;
    update();
  }

  void incrementRxNum() => rxNum++;
}
