import 'package:flutter/material.dart';

class SliverTitleWidget extends StatelessWidget {
  final String title;

  const SliverTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
