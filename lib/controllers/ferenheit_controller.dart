import 'package:get/get.dart';
// import 'dart:math';

class ThermoconvertorController extends GetxController {
  final celsiusSlider = 0.0.obs;

  final _tempInFarenheit = 0.0.obs;

  String get tempInFarenheit => _tempInFarenheit.toStringAsFixed(2);

  void updateCelsiusValue(value) {
    celsiusSlider.value = value;
  }

  void getTempInFareheit() {
    //check for infinity or NAN errors
    if (celsiusSlider.value == 0) {
      _tempInFarenheit.value = 0;
    } else {
      _tempInFarenheit.value = (1.8 * celsiusSlider.value) + 32;

      // double rate = rateSlider.value;
      // _monthlyInterest.value =
      //     (investmentSlider.value * pow((1 + rate), tenureSlider.value)) -
      //         fixedAmountSlider.value *
      //             ((pow((1 + rate), tenureSlider.value) - 1) / rate);
      // showSnackbar();
    }
    _tempInFarenheit.refresh();
  }
}
