import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:get/get.dart';

class BaseRoundButton extends StatelessWidget {
  String buttonText;
  Function onPress;
  Color buttonFgColor;
  Color buttonBgColor;
  Color borderColor;
  double width;
  double height;
  double borderWidth;
  Icon? prefixIcon;
  Icon? suffixIcon;

  BaseRoundButton({super.key,
    required this.buttonText,
    required this.onPress,
    required this.buttonFgColor,
    required this.buttonBgColor,
    this.borderColor = Colors.transparent,
    this.width = double.maxFinite,
    this.height = 56,
    this.borderWidth = 1,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.contentPadding, vertical: AppConfig.innerPadding),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfig.borderRadiusSub),
          color: buttonBgColor,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: prefixIcon!
              ),

            Text(
              buttonText,
              style: TextStyle(fontSize: AppConfig.subTitleFontSize, fontWeight: FontWeight.w500, color: buttonFgColor),
            ),

            if (suffixIcon != null)
              Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: suffixIcon!
              ),
          ],
        ),
      ),
    );
  }
}
