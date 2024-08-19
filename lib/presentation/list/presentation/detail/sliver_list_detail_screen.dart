import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/common/base_round_button.dart';
import 'package:flutter_factory/presentation/list/presentation/detail/sliver_list_detail_controller.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_grid_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_list_widget.dart';
import 'package:get/get.dart';

import '../../../../config/app_config.dart';
import '../../widgets/sliver_app_bar_title.dart';
import '../../widgets/sliver_tap_view_widget.dart';
import '../../widgets/sliver_title_widget.dart';

class SliverListDetailScreen extends StatefulWidget {
  const SliverListDetailScreen({super.key});

  @override
  State<SliverListDetailScreen> createState() => _SliverListDetailScreenState();
}

class _SliverListDetailScreenState extends State<SliverListDetailScreen> {
  late SliverListDetailController controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.isRegistered<SliverListDetailController>() ? Get.find<SliverListDetailController>() : Get.put(SliverListDetailController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingButtons(),
        body: const CustomScrollView(
          slivers: [
            SliverAppBarTitle(),
            SliverTitleWidget(),
            SliverListWidget(),
            SliverGridWidget(),
            SliverTapViewWidget(),
          ],
        ),
      ),
    );
  }

  Widget floatingButtons() {
    double buttonWidth = (Get.width / 3);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BaseRoundButton(
          buttonText: '샘플 버튼',
          onPress: () {},
          buttonFgColor: Colors.white,
          buttonBgColor: Colors.black,
          width: buttonWidth - AppConfig.innerPadding,
        ),
        const SizedBox(
          width: AppConfig.contentPadding,
        ),
        BaseRoundButton(
          buttonText: '샘플 버튼',
          onPress: () {},
          buttonFgColor: Colors.black,
          buttonBgColor: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          width: buttonWidth * 2 - AppConfig.innerPadding,
        ),
      ],
    );
  }
}
