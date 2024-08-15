import 'package:get/get.dart';

class MainController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;

  void setBottomTab(int index) {
    currentTabIndex.value = index;

    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
    }
  }
}