import 'package:get/get.dart';

class SliverListDetailController extends GetxController {
  int id = 0;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    print(id);
  }
}
