import 'package:calculator_app/controllers/loanpage_controller.dart';
import 'package:calculator_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../utils/widget/primary_button.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoanController controller = Get.put(LoanController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Image.asset(
                  AppImages.appLogo,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const Text(
              'Loan Calculator',
              style: TextStyle(
                  fontSize: AppSizes.fontSizeLg,
                  fontWeight: AppSizes.fontWeightBold),
            ),
            const SizedBox(
              height: AppSizes.mediumDefaultSpace,
            ),
            //loan amount section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Loan amount',
                      style: TextStyle(color: grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor10,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Text(
                              '₦${controller.loanSlider.round()}',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.loanSlider.value,
                      min: 0,
                      max: 100000,
                      divisions: 10,
                      label: controller.loanSlider.round().toString(),
                      onChanged: (value) {
                        controller.loanSlider(value);
                      },
                    )),
              ],
            ),
            // rate of interest section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Interest Rate',
                      style: TextStyle(color: grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor10,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Text(
                              '${controller.rateSlider.round()}%',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.rateSlider.value,
                      min: 0.0,
                      max: 50.0,
                      divisions: 10,
                      label: controller.rateSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateRateValue(value);
                      },
                    )),
              ],
            ),
            //period section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tenure',
                      style: TextStyle(color: grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor10,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Text(
                              '${controller.tenureSlider.round()},yrs',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.tenureSlider.value,
                      min: 0,
                      max: 60,
                      divisions: 12,
                      label: controller.tenureSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateTenureValue(value);
                      },
                    )),
              ],
            ),

            // monthly emi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MOnthly EMI',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(() {
                  controller.getMonthlyInterest();
                  return Text(controller.monthlyEMI);
                })
              ],
            ),

            // total payment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Payment',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(() {
                  controller.getMonthlyInterest();
                  return Text(controller.totalPayment,
                      style: const TextStyle(
                          fontSize: AppSizes.fontSizeMd, color: grey));
                })
              ],
            ),

            // total interest
            Row(
              children: [
                const Text(
                  'Total Interest',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(() {
                  controller.getMonthlyInterest();
                  return Text(controller.totalInterest,
                      style: const TextStyle(
                          fontSize: AppSizes.fontSizeMd, color: grey));
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButon(onPressed: () {
                  displaySnackBar(
                      'Your Monthly EMI Result is ₦${controller.monthlyEMI}');
                })
              ],
            ),
          ],
        ),
      )),
    );
  }
}

displaySnackBar(text) {
  return Get.showSnackbar(GetSnackBar(
    messageText: Text(
      text,
      textAlign: TextAlign.center,
      style:
          const TextStyle(color: Colors.white, fontSize: AppSizes.fontSizeMd),
    ),
    duration: const Duration(seconds: 3),
  ));
}
