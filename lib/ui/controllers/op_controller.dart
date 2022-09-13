import 'package:get/get.dart';

import '../pages/home_page.dart';

class OpController extends GetxController {
  var _score = 0.obs;
  var _op1 = 0.obs;
  var _op2 = 0.obs;
  late int _rta;
  var _vectorRta = <int>[].obs;

  int get score => _score.value;
  int get op1 => _op1.value;
  int get op2 => _op2.value;
  int get rta => _rta;
  List<int> get vRta => _vectorRta;

  setValues() {
    _op1.value = RandomInt.generate(max: 50);
    _op2.value = RandomInt.generate(max: 50);

    _rta = op1 + op2;
    _vectorRta.clear();
    _vectorRta.add(_rta);
    _vectorRta.add(_rta + 1);
    _vectorRta.add(_rta - 1);
    _vectorRta.shuffle();
  }

  onResultClick(int value) {
    (value == _rta) ? _score.value++ : {};
    setValues();
  }

  reset() {
    _score.value = 0;
    setValues();
  }
}
