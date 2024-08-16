import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';

class BaseRowFilter extends StatelessWidget {
  final List<String> items;

  const BaseRowFilter({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: AppConfig.contentPadding),
          for (String item in items)
            Padding(
                padding: const EdgeInsets.all(AppConfig.contentPadding / 2),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppConfig.borderRadiusSub), color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: AppConfig.innerPadding, vertical: AppConfig.contentPadding),
                    child: Text(
                      item,
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
