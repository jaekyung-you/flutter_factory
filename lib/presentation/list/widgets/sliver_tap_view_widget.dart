import 'package:flutter/material.dart';

class SliverTapViewWidget extends StatefulWidget {
  const SliverTapViewWidget({super.key});

  @override
  State<SliverTapViewWidget> createState() => _SliverTapViewWidgetState();
}

class _SliverTapViewWidgetState extends State<SliverTapViewWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Car"),
              Tab(icon: Icon(Icons.directions_transit), text: "Transit"),
              Tab(icon: Icon(Icons.directions_bike), text: "Bike"),
            ],
          ),
          SizedBox(
            height: 800,
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text("Car Page")),
                Center(child: Text("Transit Page")),
                Center(child: Text("Bike Page")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
