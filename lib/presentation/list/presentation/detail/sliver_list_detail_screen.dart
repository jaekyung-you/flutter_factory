import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/list/presentation/detail/sliver_list_detail_controller.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_grid_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_list_widget.dart';
import 'package:get/get.dart';

import '../../widgets/sliver_app_bar_title.dart';

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
        body: const CustomScrollView(
          slivers: [
            SliverAppBarTitle(),
            SliverListWidget(),
            SliverGridWidget(),
          ],
        ),
      ),
    );
  }
}
