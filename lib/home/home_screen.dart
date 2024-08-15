import 'package:flutter/material.dart';
import 'package:flutter_factory/home/home_controller.dart';
import 'package:get/get.dart';

import '../config/app_config.dart';
import '../presentation/common/base_round_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              BaseRoundButton(
                buttonText: '팝업 표기',
                onPress: () => controller.showPopup(),
                buttonFgColor: Colors.white,
                buttonBgColor: Colors.black,
              ),
              const SizedBox(
                height: AppConfig.innerPadding,
              ),
              BaseRoundButton(
                buttonText: '바텀 시트 표기',
                onPress: () => controller.showBottomSheet(),
                buttonFgColor: Colors.white,
                buttonBgColor: Colors.black,
              )
            ],
          );
        });
    ;
  }
}
