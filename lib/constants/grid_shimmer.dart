import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1 / 1.5,
        ),
        //Now let's create our custom List tile
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
              decoration: decoratedShadowBox(context),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 150,
                      child: Image.asset(
                        "images/news.png",
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover,
                      ))
                ],
              ));
        },
      ),
    );
  }
}

BoxDecoration decoratedShadowBox(BuildContext context) {
  return BoxDecoration(color: Theme.of(context).cardColor,
      // borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(5, 5),
        )
      ]);
}
