import 'package:flutter/material.dart';
import 'package:project_neal/constant.dart';
import 'package:project_neal/widgets/ElementCard/Laptop.dart';
import 'package:project_neal/widgets/ElementCard/fan.dart';
import 'package:project_neal/widgets/ElementCard/light.dart';
import 'package:project_neal/widgets/ElementCard/other.dart';
import 'package:project_neal/widgets/SquareCard/bath_room.dart';
import 'package:project_neal/widgets/SquareCard/bed_room.dart';
import 'package:project_neal/widgets/SquareCard/dining_room.dart';
import 'package:project_neal/widgets/SquareCard/living_room.dart';

class MiddleTabs extends StatefulWidget {
  const MiddleTabs({super.key});

  @override
  State<MiddleTabs> createState() => _MiddleTabsState();
}

class _MiddleTabsState extends State<MiddleTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // Use "this" as the vsync
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  List roomWidget = [
    LivingRoom(),
    Bathroom(),
    BedRoom(),
    DiningRoom(),
  ];

  List elementWidget = [
    Light(),
    Fan(),
    Laptop(),
    Other(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .95,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: _tabController,
                // labelPadding: const EdgeInsets.only(
                //   left: 0,
                //   right: 0,
                // ),
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: kButtonDarkBlue,
                indicatorPadding: EdgeInsets.all(5),
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: kFontLightGrey,
                tabs: [
                  Tab(
                    text: "All Room",
                  ),
                  Tab(
                    text: "Living Room",
                  ),
                  Tab(
                    text: "Bedroom",
                  ),
                  Tab(
                    text: "Bathroom",
                  ),
                ]),
          ),
        ),
        Container(
          width: 300,
          height: 350,
          child: Expanded(
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      child: roomWidget[index],
                    );
                  }),
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      child: elementWidget[index],
                    );
                  }),
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      child: elementWidget[index],
                    );
                  }),
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      child: elementWidget[index],
                    );
                  }),
            ]),
          ),
        ),
      ],
    );
  }
}
