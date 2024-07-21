import 'package:calculator_app/controllers/bmi_controller.dart';
import 'package:calculator_app/utils/constants/colors.dart';
import 'package:calculator_app/utils/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BmiController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              'Bmi Calculator',
              style: TextStyle(
                  fontSize: AppSizes.fontSizeLg,
                  fontWeight: AppSizes.fontWeightBold),
            ),
            const SizedBox(
              height: AppSizes.mediumDefaultSpace,
            ),
            //weight section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Weight',
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
                              '${controller.weightSlider.round()}kg',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.weightSlider.value,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: controller.weightSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateWeightValue(value);
                      },
                    )),
              ],
            ),

            //height section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Height',
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
                              '${controller.heightSlider.round()}m',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.heightSlider.value,
                      min: 0.0,
                      max: 2.5,
                      divisions: 5,
                      label: controller.heightSlider.toString(),
                      onChanged: (value) {
                        controller.updateHeightValue(value);
                      },
                    )),
              ],
            ),

            //height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Height',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '${controller.heightSlider.round()}m',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),

            //weight
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '${controller.weightSlider.round()}kg',
                    style: const TextStyle(color: black),
                  ),
                )
              ],
            ),

            //bmi result
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bmi Result',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(() {
                  controller.getBmiTotal();
                  return Text(
                    controller.bmiTotal,
                    style:
                        TextStyle(fontSize: AppSizes.fontSizeMd, color: black),
                  );
                })
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButon(onPressed: () {
                  displaySnackBar(
                      'Your Bmi Result is ${controller.bmiTotal}kg/m 2');
                })
              ],
            ),
          ]),
        ),
      ),
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
