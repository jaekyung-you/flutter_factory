import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/common/base_round_button.dart';
import 'package:get/get.dart';

import '../../config/app_config.dart';

class BasePopup extends StatefulWidget {
  String title;
  String? desc;
  Widget? content;
  String firstButtonText;
  String? secondButtonText;
  String? thirdButtonText;
  Function? onPressFirstButton;
  Function? onPressSecondButton;
  Function? onPressThirdButton;

  // 버튼 1개
  BasePopup({super.key, required this.title, this.desc, this.content, required this.firstButtonText, this.onPressFirstButton});

  // 버튼 2개
  BasePopup.twoButton({
    super.key,
    required this.title,
    this.desc,
    this.content,
    required this.firstButtonText,
    required this.secondButtonText,
    this.onPressFirstButton,
    this.onPressSecondButton,
  });

  // 버튼 3개
  BasePopup.threeButton({
    super.key,
    required this.title,
    this.desc,
    this.content,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.thirdButtonText,
    this.onPressFirstButton,
    this.onPressSecondButton,
    this.onPressThirdButton,
  });

  @override
  State<BasePopup> createState() => _BasePopupState();
}

class _BasePopupState extends State<BasePopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: AppConfig.outerPadding * 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConfig.borderRadiusSub)),
      backgroundColor: Colors.white,
      shadowColor: null,
      surfaceTintColor: null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.innerPadding * 2, vertical: AppConfig.innerPadding * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 닫기 버튼
            Row(
              children: [
                const Spacer(),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.close)),
              ],
            ),


            /// 제목
            Text(widget.title, style: TextStyle(fontSize: AppConfig.headerFontSize, fontWeight: FontWeight.bold),),

            /// 내용
            ///
            /// 버튼
            BaseRoundButton(buttonText: '확인', onPress: () { Get.back(); }, buttonFgColor: Colors.white, buttonBgColor: Colors.black, height: 50,)
          ],
        ),
      ),
    );
  }
}
