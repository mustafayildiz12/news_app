import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

AppBar bottomAppBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.blueGrey,
      ),
      onPressed: () {
        _scaffoldKey.currentState!.openDrawer();
      },
    ),
    title: const Text(
      "DECO NEWS",
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    bottom: tabbars(),
  );
}

TabBar tabbars() {
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
