import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:get/get.dart';

class BaseRoundButton extends StatelessWidget {
  String buttonText;
  Function onPress;
  Color buttonFgColor;
  Color buttonBgColor;
  double width;
  double height;

  BaseRoundButton(
      {super.key,
      required this.buttonText,
      required this.onPress,
      required this.buttonFgColor,
      required this.buttonBgColor,
      this.width = double.maxFinite,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.innerPadding * 2, vertical: AppConfig.innerPadding),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfig.borderRadiusSub),
          color: buttonBgColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: AppConfig.subTitleFontSize, fontWeight: FontWeight.w500, color: buttonFgColor),
        ),
      ),
    );
  }
}
