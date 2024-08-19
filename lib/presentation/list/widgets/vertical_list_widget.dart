import 'package:flutter/material.dart';

import '../../../config/app_config.dart';

class VerticalListWidget extends StatefulWidget {
  const VerticalListWidget({super.key});

  @override
  State<VerticalListWidget> createState() => _VerticalListWidgetState();
}

class _VerticalListWidgetState extends State<VerticalListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConfig.borderRadiusMain),
            color: Colors.pink.withOpacity(0.3),
          ),
          height: 100,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
