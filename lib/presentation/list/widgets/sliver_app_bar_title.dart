import 'package:flutter/material.dart';

class SliverAppBarTitle extends StatelessWidget {
  const SliverAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      collapsedHeight: 60,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('sliver list app bar'),
        background: Image.network(
          'https://picsum.photos/200/300', // 이미지 링크
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
