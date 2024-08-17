import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_grid_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/sliver_list_widget.dart';

import '../../widgets/sliver_app_bar_title.dart';

class SliverListScreen extends StatefulWidget {
  const SliverListScreen({super.key});

  @override
  State<SliverListScreen> createState() => _SliverListScreenState();
}

class _SliverListScreenState extends State<SliverListScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBarTitle(),
        SliverListWidget(),
        SliverGridWidget(),
      ],
    );
  }
}
