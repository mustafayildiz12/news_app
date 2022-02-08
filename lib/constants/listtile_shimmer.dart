import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmmer extends StatelessWidget {
  const ListShimmmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        //Now let's create our custom List tile
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shadowColor: Colors.grey.shade200,
            child: ListTile(
              leading: SizedBox(
                width: 100,
                height: 75,
                child: Image.asset(
                  "images/news.png",
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
