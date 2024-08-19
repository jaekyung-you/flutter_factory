import 'package:flutter/material.dart';

class SliverTitleWidget extends StatefulWidget {
  const SliverTitleWidget({super.key});

  @override
  State<SliverTitleWidget> createState() => _SliverTitleWidgetState();
}

class _SliverTitleWidgetState extends State<SliverTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        'Title1',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
