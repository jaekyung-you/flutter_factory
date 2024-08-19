import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagePageView extends StatefulWidget {
  const ImagePageView({super.key});

  @override
  State<ImagePageView> createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView> {
  final PageController _pageController = PageController();
  final List<String> imageUrls = [
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/2/200/300',
    'https://picsum.photos/id/3/200/300',
    'https://picsum.photos/id/4/200/300',
    'https://picsum.photos/id/5/200/300',
  ];

  @override
  void initState() {
    super.initState();
    // 자동 swipe
    Future.delayed(Duration(seconds: 3), () {
      _pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.network(imageUrls[index], fit: BoxFit.cover),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: imageUrls.length,
          effect: ExpandingDotsEffect(),
          onDotClicked: (int index) {
            _pageController.jumpToPage(index);
          },
        )
      ],
    );
  }
}
