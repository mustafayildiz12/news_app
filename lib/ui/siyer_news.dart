import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../constants/grid_shimmer.dart';
import '../models/categories_model.dart';
import '../models/news.dart';
import '../models/siyer_dergi_model.dart';
import '../service/api_service.dart';
import 'detail_news.dart';

class SiyerNews extends StatefulWidget {
  const SiyerNews({Key? key}) : super(key: key);

  @override
  _SiyerNewsState createState() => _SiyerNewsState();
}

class _SiyerNewsState extends State<SiyerNews> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder(
        future: client.getAllCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<SiyerCategoriesModel>> snapshot) {
          List<SiyerCategoriesModel>? news = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: news!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.indigo),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                            color: Colors.amberAccent,
                            child: Text(
                              news[index].name.toString(),
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
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
