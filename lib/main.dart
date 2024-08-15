import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/common/base_popup.dart';
import 'package:flutter_factory/presentation/common/base_round_button.dart';
import 'package:get/get.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Pretendard",
      ),
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
  int _counter = 0;

  void _showPopup() {
    // Get.dialog(BasePopup(
    //     title: '팝업 타이틀',
    //     desc: '팝업 내용',
    //     content: Container(
    //       color: Colors.red,
    //       width: 100,
    //       height: 100,
    //     ),
    //     firstButtonText: '확인'));

    // Get.dialog(BasePopup.twoButton(
    //   title: '팝업 타이틀',
    //   desc: '팝업 내용',
    //   content: Container(
    //     color: Colors.red,
    //     width: 100,
    //     height: 100,
    //   ),
    //   firstButtonText: '확인',
    //   onPressFirstButton: () {},
    //   secondButtonText: '두번째 버튼',
    //   onPressSecondButton: () {},
    // ));

    Get.dialog(BasePopup.threeButton(
      title: '팝업 타이틀',
      desc: '팝업 내용',
      content: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      firstButtonText: '확인',
      onPressFirstButton: () {},
      secondButtonText: '두번째 버튼',
      onPressSecondButton: () {},
      thirdButtonText: '세번째 버튼',
      onPressThirdButton: () {},
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(''),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            BaseRoundButton(
              buttonText: '팝업 표기',
              onPress: () => _showPopup(),
              buttonFgColor: Colors.white,
              buttonBgColor: Colors.black,

            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
