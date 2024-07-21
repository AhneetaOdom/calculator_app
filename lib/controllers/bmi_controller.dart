import 'dart:math';

import 'package:get/get.dart';

class BmiController extends GetxController {
  final heightSlider = 0.0.obs;
  final weightSlider = 0.0.obs;
  final _getBmiTotal = 0.0.obs;

  String get bmiTotal => _getBmiTotal.toStringAsFixed(2);

  void updateWeightValue(value) {
    weightSlider.value = value;
  }

  void updateHeightValue(value) {
    heightSlider.value = value;
  }

  void getBmiTotal() {
    //check for infinity or NAN errors
    if (weightSlider.value == 0 || heightSlider.value == 0) {
      _getBmiTotal.value = 0;
    } else {
      _getBmiTotal.value = weightSlider.value / pow(heightSlider.value, 2);

      // double rate = rateSlider.value;
      // _monthlyInterest.value =
      //     (investmentSlider.value * pow((1 + rate), tenureSlider.value)) -
      //         fixedAmountSlider.value *
      //             ((pow((1 + rate), tenureSlider.value) - 1) / rate);
      // showSnackbar();
    }
    _getBmiTotal.refresh();
  }
}
