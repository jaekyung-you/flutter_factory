import 'package:flutter/material.dart';
import 'package:flutter_factory/config/app_config.dart';

class CityFilter extends StatelessWidget {
  final TextEditingController textEditingController;

  const CityFilter({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConfig.innerPadding),
      child: Row(
        children: [
          InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(AppConfig.contentPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('도시'),
            ),
          ),

          const SizedBox(width: 4),
          Expanded(child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '장소 검색',
            ),
          )),

          const SizedBox(width: 4),


          InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(AppConfig.contentPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add),
            ),
          ),

        ],
      ),
    );
  }
}
