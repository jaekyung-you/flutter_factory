import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/list/widgets/grid_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/list_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridWidget(),
            ListWidget(),
          ],
        ),
      ),
    );
  }
}
