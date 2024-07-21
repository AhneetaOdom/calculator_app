import 'dart:math';
import 'package:get/get.dart';

class LoanController extends GetxController {
  final loanSlider = 100.0.obs;
  final rateSlider = 10.0.obs;
  final tenureSlider = 5.0.obs;
  final _monthlyInterest = 0.0.obs;
  final _totalInterest = 0.0.obs;
  final _totalPayment = 0.0.obs;
  String get monthlyEMI => _monthlyInterest.toStringAsFixed(2);
   String get totalPayment=> _totalPayment.toStringAsFixed(2);
    String get totalInterest=> _totalInterest.toStringAsFixed(2);

  void updateLoanValue(value) {
    loanSlider.value = value;
  }

  void getMonthlyInterest() {
    //check for infinity or NAN errors
    if (tenureSlider.value == 0 || rateSlider.value == 0) {
      _monthlyInterest.value = 0;
    } else {
      double rate = rateSlider.value / 1200;
      _monthlyInterest.value = loanSlider.value *
          rate *
          pow((1 + rate), tenureSlider.value) /
          (pow((1 + rate), tenureSlider.value) - 1);

           _totalPayment.value= _monthlyInterest.value * tenureSlider.value;
            _totalInterest.value = _totalPayment.value - _monthlyInterest.value;
     
    }
    _monthlyInterest.refresh();
  }



  void updateRateValue(value) {
    rateSlider.value = value;
  }

  void updateTenureValue(value) {
    tenureSlider.value = value;
  }


}
