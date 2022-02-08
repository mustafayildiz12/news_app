import 'dart:async';
import 'dart:math';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../constants/deco_news_widgets.dart';
import '../constants/drawer_list.dart';
import '../constants/grid_shimmer.dart';
import '../models/wordpress_model.dart';
import '../service/api_service.dart';
import 'my_news.dart';

class DecoNewsScreen extends StatefulWidget {
  const DecoNewsScreen({Key? key}) : super(key: key);

  @override
  _DecoNewsScreenState createState() => _DecoNewsScreenState();
}

class _DecoNewsScreenState extends State<DecoNewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Service client = Service();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(milliseconds: 700), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            key: _scaffoldKey,
            drawer: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: const Color(0xFF1B1D29)),
                child: const DrawerHeaderMenu()),
            appBar: bottomAppBar(),
            body: LiquidPullToRefresh(
              key: _refreshIndicatorKey,
              onRefresh: _handleRefresh,
              showChildOpacityTransition: false,
              child: PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: const TabBarView(
                  children: [
                    MyNews(),
                    MyNews(),
                    Center(child: Text("Tab 3")),
                    Center(child: Text("Tab 4")),
                    Center(child: Text("Tab 5")),
                    Center(child: Text("Tab 6")),
                    Center(child: Text("Tab 7")),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  FutureBuilder<List<WordPressModel>> homeTab() {
    return FutureBuilder(
      future: client.getNews(),
      builder:
          (BuildContext context, AsyncSnapshot<List<WordPressModel>> snapshot) {
        //let's check if we got a response or not

        if (snapshot.hasData) {
          //Now let's make a list of articles
          List<WordPressModel>? news = snapshot.data;
          return GridView.builder(
            shrinkWrap: true,
            //Now let's create our custom List tile
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 1 / 1.5,
            ),
            itemCount: news!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
                child: animatedContainer(news, index, context),
              );
            },
          );
        }
        return const GridShimmer();
      },
    );
  }

  AppBar bottomAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: Text(
        "DECO NEWS",
        style: TextStyle(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).cardColor,
      centerTitle: true,
      bottom: tabbars(),
    );
  }

  TabBar tabbars() {
    return TabBar(
      indicatorColor: Theme.of(context).indicatorColor,
      labelColor: Theme.of(context).indicatorColor,
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
