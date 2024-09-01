import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GoogleMapClientController extends GetxController {
  TextEditingController placeTextController = TextEditingController(); // 장소 검색
  DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  RxBool initializedMap = false.obs;
}
