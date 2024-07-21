import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ferenheit_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../utils/widget/primary_button.dart';

class TemperatureConverter extends StatelessWidget {
  const TemperatureConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThermoconvertorController());
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
              'Farenheit Converter Calculator',
              style: TextStyle(
                  fontSize: AppSizes.fontSizeLg,
                  fontWeight: AppSizes.fontWeightBold),
            ),
            const SizedBox(
              height: AppSizes.mediumDefaultSpace,
            ),
            //celsius section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Temperature in Celsius',
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
                              '${controller.celsiusSlider.round()}°C',
                              style: const TextStyle(color: primaryColor),
                            ),
                          )),
                    )
                  ],
                ),
                Obx(() => Slider(
                      value: controller.celsiusSlider.value,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: controller.celsiusSlider.round().toString(),
                      onChanged: (value) {
                        controller.updateCelsiusValue(value);
                      },
                    )),
              ],
            ),

            // celsius
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Celsius',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(
                  () => Text(
                    '${controller.celsiusSlider.round()}°C',
                    style: const TextStyle(
                        fontSize: AppSizes.fontSizeMd, color: black),
                  ),
                )
              ],
            ),

            //celsius to farenheit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text(
                  'Farenheit Result',
                  style: TextStyle(fontSize: AppSizes.fontSizeMd, color: grey),
                ),
                Obx(() {
                  controller.getTempInFareheit();
                  return Text(
                    '${controller.tempInFarenheit}F',
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
                      'Your Celsius to Farenheit Conversion Result is ${controller.tempInFarenheit}F');
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
