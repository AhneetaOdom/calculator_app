import 'package:calculator_app/controllers/swp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../utils/widget/primary_button.dart';

class SwpPage extends StatelessWidget {
  const SwpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SwpController());
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
              'Systematic Withdrawal Plan Calculator',
              style: TextStyle(
                  fontSize: AppSizes.fontSizeLg,
                  fontWeight: AppSizes.fontWeightBold),
            ),
            const SizedBox(
              height: AppSizes.mediumDefaultSpace,
            ),

            // initial investment amount section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      ' Initial Investment Amount',
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
                              '₦${controller.investmentSlider.round()}',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.investmentSlider.value,
                      min: 0,
                      max: 100000,
                      divisions: 10,
                      label: controller.investmentSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateInvestmentValue(value);
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
                      'Periodic Rate of Return',
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
                              '${controller.tenureSlider.round()}yrs',
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

            // fixed withdrawal amount per period section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      ' Fixed Withdrawal Amount Per Period',
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
                              '₦${controller.fixedAmountSlider.round()}',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.fixedAmountSlider.value,
                      min: 0,
                      max: 10000,
                      divisions: 10,
                      label: controller.fixedAmountSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateFixedAmountValue(value);
                      },
                    )),
              ],
            ),

            //' Initial Investment Amount'
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Initial Investment Amount',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '₦${controller.investmentSlider.round()}',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),

            //Periodic Rate of Return
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Periodic Rate of Return',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '${controller.rateSlider.round()}%',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),

            //Tenure
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tenure',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '${controller.tenureSlider.round()}yrs',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fixed Withdrawal Amount Per Period',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '₦${controller.fixedAmountSlider.round()}',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButon(onPressed: () {
                  displaySnackBar(
                      'Your Investment Result is ₦${controller.fixedAmountSlider}');
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
      style: TextStyle(color: Colors.white, fontSize: AppSizes.fontSizeMd),
    ),
    duration: Duration(seconds: 3),
  ));
}
