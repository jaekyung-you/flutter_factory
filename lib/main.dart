import 'package:flutter/material.dart';
import 'package:flutter_factory/home/home_screen.dart';
import 'package:flutter_factory/presentation/chat/chat_screen.dart';
import 'package:flutter_factory/presentation/list/presentation/list/list_screen.dart';
import 'package:flutter_factory/presentation/list/presentation/detail/sliver_list_detail_screen.dart';
import 'package:flutter_factory/presentation/map/map_screen.dart';
import 'package:flutter_factory/routes/factory_routes.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        fontFamily: "Pretendard",
      ),
      getPages: FlutterRoutes.routes,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MainController mainController;

  @override
  void initState() {
    super.initState();
    mainController = Get.put(MainController());
  }

  static const List<Widget> screens = [
    HomeScreen(),
    ListScreen(),
    MapScreen(),
    ChatScreen(), // todo: 앱 시동시 자동로그인이면 MyPageScreen으로 전환
    HomeScreen(),
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: Text(''),
    //   ),
    //   body: Obx(() => Container(
    //         child: (() {
    //           switch (mainController.currentTabIndex.value) {
    //             case 0:
    //               return const HomeScreen();
    //
    //             case 1:
    //             case 2:
    //               return const MapScreen();
    //             case 3:
    //             case 4:
    //           }
    //         })(),
    //       )),
    //   bottomNavigationBar: mainBottomNav(),
    // );

    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '메인'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '기능1'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '기능2'),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: '기능3'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget mainBottomNav() {
//   return Obx(() {
//     return BottomNavigationBar(
//       currentIndex: mainController.currentTabIndex.value,
//       onTap: mainController.setBottomTab,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: '메인', backgroundColor: Colors.purple),
//         BottomNavigationBarItem(icon: Icon(Icons.list), label: '기능1', backgroundColor: Colors.purple),
//         BottomNavigationBarItem(icon: Icon(Icons.map), label: '기능2'),
//         BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: '기능3'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
//       ],
//     );
//   });
// }
