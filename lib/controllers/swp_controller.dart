 import 'dart:math';
import 'package:get/get.dart';


class SwpController extends GetxController {
  final investmentSlider = 1000.0.obs;
  final rateSlider = 10.0.obs;
  final tenureSlider = 5.0.obs;
  final fixedAmountSlider = 500.0.obs;

  final _monthlyInterest = 0.0.obs;
  final _totalWithdrawal = 0.0.obs;
  final _totalInterest = 0.0.obs;

  String get monthlyInterest => _monthlyInterest.toStringAsFixed(2);
  String get totalWithdrawal => _totalWithdrawal.toStringAsFixed(2);
  String get totalInterest => _totalInterest.toStringAsFixed(2);

  void updateInvestmentValue(double value) {
    investmentSlider.value = value;
  }

  void updateRateValue(double value) {
    rateSlider.value = value;
  }

  void updateTenureValue(double value) {
    tenureSlider.value = value;
  }

  void updateFixedAmountValue(double value) {
    fixedAmountSlider.value = value;
  }

  void calculateSwpDetails() {
    double investment = investmentSlider.value;
    double annualRate = rateSlider.value;
    int tenure = tenureSlider.value.toInt();
    double fixedWithdrawal = fixedAmountSlider.value;

    double monthlyRate = annualRate / 12 / 100;
    int numberOfMonths = tenure * 12;

    double accumulatedAmount =
        investment * pow(1 + monthlyRate, numberOfMonths);
    double totalWithdrawal = fixedWithdrawal * numberOfMonths;
    double totalInterest = accumulatedAmount - investment;

    _monthlyInterest.value = accumulatedAmount / numberOfMonths;
    _totalWithdrawal.value = totalWithdrawal;
    _totalInterest.value = totalInterest;
  }
}
