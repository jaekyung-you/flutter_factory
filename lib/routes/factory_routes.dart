import 'package:get/get.dart';

import '../main.dart';
import 'factory_path.dart';

class FlutterRoutes {
  FlutterRoutes._privateConstructor();

  static final _instance = FlutterRoutes._privateConstructor();

  factory FlutterRoutes() {
    return _instance;
  }

  static final routes = [
    GetPage(name: FlutterPath.HOME, page: () => const MyHomePage()),
  ];
}