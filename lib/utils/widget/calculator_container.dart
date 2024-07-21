import 'package:calculator_app/controllers/homepage_conroller.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class CalculatorContainer extends StatelessWidget {
  const CalculatorContainer({
    super.key,
    required this.index,
    // required this.text,
  });

  final int index;
  // final String text;

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.smallDefaultSpace),
            color: primaryColor10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
             controller.calcuatorButtonList[index].image,
            height: AppSizes.iconSize,
            width: AppSizes.iconSize,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              controller.calcuatorButtonList[index].title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: black, fontSize: AppSizes.fontSizeXxs),
            ),
          )
        ]),
      ),
    );
  }
}
