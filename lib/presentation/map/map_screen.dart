import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:flutter_factory/presentation/common/base_row_filter.dart';
import 'package:flutter_factory/presentation/map/map_controller.dart';
import 'package:flutter_factory/presentation/map/widgets/city_filter.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController controller;
  final _sheet = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<MapController>() ? Get.find<MapController>() : Get.put(MapController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          Container(color: Colors.green),

          // Filter & FloatingButton, BottomSheet
          Column(
            children: [
              CityFilter(
                textEditingController: controller.placeTextController,
              ),
              const SizedBox(height: AppConfig.contentPadding / 2),
              BaseRowFilter(items: ['내 저장', '주변명소', '식당', '카페', '편의시설', '쇼핑']),
            ],
          ),

          DraggableScrollableSheet(
              key: _sheet,
              initialChildSize: 0.5,
              maxChildSize: 1,
              minChildSize: 0.2,
              expand: true,
              snap: true,
              snapSizes: const [0.5],
              controller: controller.draggableScrollableController,
              builder: (context, scrollController) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      const SliverToBoxAdapter(
                        child: Text('Title'),
                      ),
                      SliverList.list(
                        children: const [
                          Text('Content'),
                        ],
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
