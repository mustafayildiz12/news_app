import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/siyer_details_model.dart';
import 'package:news_app/ui/siyer_detail.dart';
import '../constants/grid_shimmer.dart';
import '../models/categories_model.dart';
import '../models/news.dart';
import '../models/siyer_dergi_model.dart';
import '../service/api_service.dart';
import 'detail_news.dart';

class SiyerAnaSayfa extends StatefulWidget {
  const SiyerAnaSayfa({Key? key}) : super(key: key);

  @override
  _SiyerAnaSayfaState createState() => _SiyerAnaSayfaState();
}

class _SiyerAnaSayfaState extends State<SiyerAnaSayfa> {
  Service client = Service();

  static String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder(
        future: client.getSiyerPosts(),
        builder: (BuildContext context,
            AsyncSnapshot<List<SiyerResponse>> snapshot) {
          List<SiyerResponse>? news = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: news!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SiyerDetailsX(
                                    id: news[index]
                                        .content!
                                        .rendered
                                        .toString(),
                                    image: news[index]
                                        .betterFeaturedImage!
                                        .sourceUrl
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Image.network(
                                news[index]
                                    .betterFeaturedImage!
                                    .sourceUrl
                                    .toString(),
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.all(4),
                              color: Colors.amberAccent,
                              child: Text(
                                stripHtmlIfNeeded(
                                    news[index].excerpt!.rendered.toString()),
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
