import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../../config/environment.dart';

class NaverMapClientController extends GetxController {
  TextEditingController placeTextController = TextEditingController(); // 장소 검색
  DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  RxBool initializedMap = false.obs;
  final marker1 = NMarker(id: 'test1', position: const NLatLng(37.506932467450326, 127.05578661133796));
  final marker2 = NMarker(id: 'test2', position: const NLatLng(37.606932467450326, 127.05578661133796));

  @override
  void onInit() async {
    super.onInit();
    await initializeNaverMap();
  }

  Future<void> initializeNaverMap() async {
    initializedMap.value = false;
    await NaverMapSdk.instance
        .initialize(clientId: Env.naverMapClientKey, onAuthFailed: (e) => print("네이버 맵 인증 오류: $e, name: onAuthFailed"));
    initializedMap.value = true;
  }
}
