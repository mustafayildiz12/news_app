import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../service/api_service.dart';

class SiyerCategories extends StatefulWidget {
  const SiyerCategories({Key? key}) : super(key: key);

  @override
  _SiyerCategoriesState createState() => _SiyerCategoriesState();
}

class _SiyerCategoriesState extends State<SiyerCategories> {
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
            return GridView.builder(
                shrinkWrap: true,
                itemCount: news!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).toggleableActiveColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news[index].name.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                                fontSize: 17),
                          ),
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
