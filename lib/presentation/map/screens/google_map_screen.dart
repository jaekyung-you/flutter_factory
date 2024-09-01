import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:flutter_factory/presentation/common/base_row_filter.dart';
import 'package:flutter_factory/presentation/map/controller/google_map_client_controller.dart';
import 'package:flutter_factory/presentation/map/widgets/city_filter.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapClientController controller;
  late GoogleMapController googleMapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final _sheet = GlobalKey();
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<GoogleMapClientController>() ? Get.find<GoogleMapClientController>() : Get.put(GoogleMapClientController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Map
            // Obx(() {
            //   return controller.initializedMap.value
            //       ? naverMapWidget()
            //       : Container(
            //           color: Colors.green,
            //         );
            // }),

            googleMapWidget(),
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
      ),
    );
  }

  Widget googleMapWidget() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      onMapCreated: (controller) {
        googleMapController = controller;
      },
    );
  }
}
