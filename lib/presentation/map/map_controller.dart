import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

import '../../config/environment.dart';

class MapController extends GetxController {
  TextEditingController placeTextController = TextEditingController(); // 장소 검색
  DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  RxBool initializedMap = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeNaverMap();
  }

  Future<void> initializeNaverMap() async {
    // WidgetsFlutterBinding.ensureInitialized();
    initializedMap.value = false;
    await NaverMapSdk.instance
        .initialize(clientId: Env.naverMapClientKey, onAuthFailed: (e) => print("네이버 맵 인증 오류: $e, name: onAuthFailed"));
    initializedMap.value = true;
  }
}
