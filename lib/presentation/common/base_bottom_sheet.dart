import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/common/base_round_button.dart';

import '../../config/app_config.dart';

class BaseBottomSheet extends StatelessWidget {
  final String title;
  final String desc;
  final Widget? content;
  final String buttonText;
  final Function onPress;

  const BaseBottomSheet(
      {super.key, required this.title, required this.desc, this.content, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConfig.contentPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConfig.borderRadiusSub),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppConfig.innerPadding),
          /// 핸들바
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConfig.innerPadding * 2),
          Text(
            title,
            style: TextStyle(fontSize: AppConfig.headerFontSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppConfig.innerPadding),
          Text(
            desc,
            style: TextStyle(fontSize: AppConfig.subTitleFontSize, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: AppConfig.innerPadding),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppConfig.innerPadding),
              child: content!,
            ),
          BaseRoundButton(buttonText: buttonText, onPress: onPress, buttonFgColor: Colors.white, buttonBgColor: Colors.black)
        ],
      ),
    );
  }
}
