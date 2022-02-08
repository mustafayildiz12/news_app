import 'package:flutter/material.dart';

class TabsMenu extends StatelessWidget {
  const TabsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.black,
      labelColor: Colors.grey.shade800,
      unselectedLabelColor: Colors.grey.shade400,
      isScrollable: true,
      tabs: const [
        Tab(
          text: "Home",
        ),
        Tab(
          text: "Technology",
        ),
        Tab(
          text: "Sport",
        ),
        Tab(
          text: "Travel",
        ),
        Tab(
          text: "NBA",
        ),
        Tab(
          text: "Politics",
        ),
        Tab(
          text: "World",
        ),
      ],
    );
  }
}
