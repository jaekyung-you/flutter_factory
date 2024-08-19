import 'package:flutter_factory/presentation/list/presentation/list/list_screen.dart';
import 'package:flutter_factory/presentation/list/presentation/detail/sliver_list_detail_screen.dart';
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
    GetPage(name: FlutterPath.LIST, page: () => const ListScreen()),
    GetPage(name: FlutterPath.DETAIL, page: () => const SliverListDetailScreen()),
  ];
}
