import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/common/base_bottom_sheet.dart';
import '../presentation/common/base_popup.dart';

class HomeController extends GetxController {
  void showPopup() {
    // Get.dialog(BasePopup(
    //     title: '팝업 타이틀',
    //     desc: '팝업 내용',
    //     content: Container(
    //       color: Colors.red,
    //       width: 100,
    //       height: 100,
    //     ),
    //     firstButtonText: '확인'));

    // Get.dialog(BasePopup.twoButton(
    //   title: '팝업 타이틀',
    //   desc: '팝업 내용',
    //   content: Container(
    //     color: Colors.red,
    //     width: 100,
    //     height: 100,
    //   ),
    //   firstButtonText: '확인',
    //   onPressFirstButton: () {},
    //   secondButtonText: '두번째 버튼',
    //   onPressSecondButton: () {},
    // ));

    Get.dialog(BasePopup.threeButton(
      title: '팝업 타이틀',
      desc: '팝업 내용',
      content: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      firstButtonText: '확인',
      onPressFirstButton: () {},
      secondButtonText: '두번째 버튼',
      onPressSecondButton: () {},
      thirdButtonText: '세번째 버튼',
      onPressThirdButton: () {},
    ));
  }

  void showBottomSheet() {
    Get.bottomSheet(BaseBottomSheet(
        title: '바텀시트 타이틀',
        desc: '바텀시트 설명',
        buttonText: '확인',
        onPress: () {
          Get.back();
        }));
  }
}
