import 'package:flutter/material.dart';

class SliverListWidget extends StatefulWidget {
  const SliverListWidget({super.key});

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text('Item $index'),
        );
      }, childCount: 3),
    );
  }
}
