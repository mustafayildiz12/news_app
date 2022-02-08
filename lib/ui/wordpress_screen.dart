import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../constants/grid_shimmer.dart';
import '../constants/listtile_shimmer.dart';
import '../constants/wordpress_widgets.dart';
import '../models/wordpress_model.dart';
import '../service/api_service.dart';

class WordpressScreen extends StatefulWidget {
  const WordpressScreen({Key? key}) : super(key: key);

  @override
  _WordpressScreenState createState() => _WordpressScreenState();
}

class _WordpressScreenState extends State<WordpressScreen> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageTransitionSwitcher(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Güncel Haberler",
                style: TextStyle(
                    fontSize: 21, color: Theme.of(context).primaryColorDark),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: client.getNews(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<WordPressModel>> snapshot) {
                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<WordPressModel>? news = snapshot.data;
                    return ListView.builder(
                      reverse: true,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: news!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(news[index]
                                              .betterFeaturedImage!
                                              .sourceUrl
                                              .toString()),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    left: 5,
                                    bottom: 10,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          news[index].date!.day.toString() +
                                              ":" +
                                              news[index]
                                                  .date!
                                                  .month
                                                  .toString() +
                                              ":" +
                                              news[index].date!.year.toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ))
                              ],
                            ));
                      },
                    );
                  }
                  return const GridShimmer();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sıradan Haberler",
                style: TextStyle(
                    fontSize: 21, color: Theme.of(context).primaryColorDark),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: client.getNews(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<WordPressModel>> snapshot) {
                  //let's check if we got a response or not
                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<WordPressModel>? news = snapshot.data;
                    return ListView.builder(
                        //Now let's create our custom List tile
                        itemCount: news!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: openContainer(news, index, context),
                          );
                        });
                  }
                  return const ListShimmmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
