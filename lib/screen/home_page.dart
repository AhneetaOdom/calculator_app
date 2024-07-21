import 'package:calculator_app/controllers/homepage_conroller.dart';

import 'package:calculator_app/utils/constants/images.dart';
import 'package:calculator_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widget/calculator_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.appLogo,
                height: 80,
                fit: BoxFit.fill,
              ),
              const Text(
                'Popular Calculator',
                style: TextStyle(
                    fontSize: AppSizes.fontSizeLg,
                    fontWeight: AppSizes.fontWeightBold),
              ),
              const SizedBox(
                height: AppSizes.mediumDefaultSpace,
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: controller.calcuatorButtonList.length,
                      itemBuilder: (context, itemIndex) {
                        return GestureDetector(
                            onTap: controller
                                .calcuatorButtonList[itemIndex].onPress,
                            child: CalculatorContainer(index: itemIndex));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
