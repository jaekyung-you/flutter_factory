import 'package:flutter/material.dart';
import 'package:flutter_factory/presentation/list/widgets/grid_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/horizontal_list_widget.dart';
import 'package:flutter_factory/presentation/list/widgets/vertical_list_widget.dart';

import '../../../../config/app_config.dart';
import '../../widgets/image_page_view.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConfig.borderRadiusSub),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title1',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              ImagePageView(),
              SizedBox(
                height: AppConfig.contentPadding,
              ),
              Text(
                'Title2',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              VerticalListWidget(),
              SizedBox(
                height: AppConfig.contentPadding,
              ),
              Text(
                'Title3',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              HorizontalListWidget(),
              SizedBox(
                height: AppConfig.contentPadding,
              ),
              Text(
                'Title4',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              GridWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
