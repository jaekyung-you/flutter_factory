import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:get/get.dart';

import '../../../routes/factory_path.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // index의 고유 id에 따라서 주입
          Get.toNamed(FlutterPath.DETAIL, arguments: {'id': 111});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConfig.borderRadiusMain),
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
