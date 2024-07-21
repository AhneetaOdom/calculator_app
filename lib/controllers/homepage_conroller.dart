import 'package:calculator_app/screen/bmi_page.dart';
import 'package:calculator_app/screen/loan_page.dart';
import 'package:calculator_app/screen/swp_page.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../screen/farenheitconverter_page.dart';

class HomePageController extends GetxController {
  final calcuatorButtonList = [
    CalcuatorButton(
        title: 'BMI Calculator',
        image: 'assets/icons/finance.png',
        onPress: () {
          Get.to(const BmiPage());
        }),
    CalcuatorButton(
        title: 'SWP Calculator',
        image: 'assets/icons/wallet.png',
        onPress: () {
          Get.to(const SwpPage());
        }),
    CalcuatorButton(
        title: 'Thermo Calculator',
        image: 'assets/icons/thermo.png',
        onPress: () {
          Get.to(const TemperatureConverter());
        }),
    CalcuatorButton(
        title: 'Loan Calculator',
        image: 'assets/icons/money.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'RD Calculator',
        image: 'assets/icons/wallet1 .png',
        onPress: () {}),
    CalcuatorButton(
        title: 'EMI Calculator',
        image: 'assets/icons/debt.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'EFP Calculator',
        image: 'assets/icons/administration.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'Income Tax Calculator',
        image: 'assets/icons/finance.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'PPF Calculator',
        image: 'assets/icons/budget.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'GST Calculator', image: 'assets/icons/tax.png', onPress: () {}),
    CalcuatorButton(
        title: 'Mutual Fund Returns Calculator',
        image: 'assets/icons/sustainable.png',
        onPress: () {}),
    CalcuatorButton(
        title: 'Sukanya Samriddhi Yojana Calculator',
        image: 'assets/icons/clipboard-with-pen.png',
        onPress: () {}),
  ];
}
