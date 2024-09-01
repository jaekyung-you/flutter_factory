import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';
import 'package:flutter_factory/presentation/common/base_row_filter.dart';
import 'package:flutter_factory/presentation/map/widgets/city_filter.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

import '../controller/naver_map_client_controller.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late NaverMapClientController naverMapClientController;
  final _sheet = GlobalKey();
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  @override
  void initState() {
    super.initState();
    naverMapClientController =
        Get.isRegistered<NaverMapClientController>() ? Get.find<NaverMapClientController>() : Get.put(NaverMapClientController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Map
            Obx(() {
              return naverMapClientController.initializedMap.value
                  ? naverMapWidget()
                  : Container(
                      color: Colors.green,
                    );
            }),
            // Filter & FloatingButton, BottomSheet
            Column(
              children: [
                CityFilter(
                  textEditingController: naverMapClientController.placeTextController,
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
                controller: naverMapClientController.draggableScrollableController,
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

  Widget naverMapWidget() {
    return NaverMap(
      options: const NaverMapViewOptions(
        indoorEnable: true, // 실내 맵 사용 가능 여부
        locationButtonEnable: false, // 위치 버튼 표시 여부 설정
        consumeSymbolTapEvents: false,
        initialCameraPosition: NCameraPosition(
          target: NLatLng(37.5666, 126.979),
          zoom: 10,
          bearing: 0,
          tilt: 0,
        ), // 심볼 탭 이벤트 소비 여부 설정
      ),
      onMapReady: (controller) async {
        controller.addOverlayAll({naverMapClientController.marker1, naverMapClientController.marker2});
        final OnMarkerInfoMap = NInfoWindow.onMarker(id: naverMapClientController.marker1.info.id, text: "웅이네 떡볶이");
        naverMapClientController.marker1.openInfoWindow(OnMarkerInfoMap);
        mapControllerCompleter.complete(controller);
      },
      onSymbolTapped: (NSymbolInfo symbolInfo) async {
        print('심볼터치? : ${symbolInfo.caption}');
      },
    );
  }
}
