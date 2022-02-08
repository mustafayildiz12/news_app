import 'package:flutter/material.dart';

import '../constants/listtile_shimmer.dart';
import '../models/news_categories_model.dart';
import '../service/api_service.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NewsCategoriesModel>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<NewsCategoriesModel>? categories = snapshot.data;
            return ListView.builder(
                //Now let's create our custom List tile
                itemCount: categories!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(categories[index].name.toString()),
                        subtitle: Text(categories[index].id.toString()),
                      ),
                    ),
                  );
                });
          }
          return const ListShimmmer();
        },
      ),
    );
  }
}
