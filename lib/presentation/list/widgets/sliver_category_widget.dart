import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:flutter_factory/presentation/common/base_round_button.dart';
import 'package:get/get.dart';

import '../../common/base_bottom_sheet.dart';

class SliverCategoryWidget extends StatefulWidget {
  const SliverCategoryWidget({super.key});

  @override
  State<SliverCategoryWidget> createState() => _SliverCategoryWidgetState();
}

class _SliverCategoryWidgetState extends State<SliverCategoryWidget> {
  List<String> categoryTitle = ['카테고리1', '카테고리2', '카테고리3'];
  List<String> content = ['내용1', '내용2', '내용3'];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConfig.innerPadding),
            child: Row(
              children: [
                for (int i = 0; i < categoryTitle.length; i++) Expanded(child: contentBox(title: categoryTitle[i], content: content[i]))
              ],
            ),
          ),
          BaseRoundButton(
              buttonText: '자세히 보기',
              onPress: () {
                Get.bottomSheet(
                    isScrollControlled: true,
                    BaseBottomSheet(
                        title: '바텀시트 타이틀',
                        desc: '바텀시트 설명',
                        content: Container(
                          height: 800,
                          color: Colors.green,
                        ),
                        bottomSheetHeight: Get.height - 100,
                        buttonText: '확인',
                        onPress: () {
                          Get.back();
                        }));
              },
              buttonFgColor: Colors.black,
              buttonBgColor: Colors.white)
        ],
      ),
    );
  }

  Widget contentBox({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(left: AppConfig.contentPadding),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(
            content,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
