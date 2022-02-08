import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/string_constant.dart';
import '../models/wordpress_model.dart';
import '../ui/detail_news.dart';
import 'grid_shimmer.dart';

OpenContainer<Object?> animatedContainer(
    List<WordPressModel> news, int index, BuildContext context) {
  return OpenContainer(
    transitionType: ContainerTransitionType.fade,
    closedBuilder: (BuildContext _, VoidCallback openContainer) {
      return Container(
        decoration: decoratedShadowBox(context),
        child: newsColumn(news, index, context),
      );
    },
    openBuilder: (BuildContext _, VoidCallback __) {
      return DetailScreen(
          source: news[index].slug.toString(),
          day: news[index].date!.day.toString(),
          month: news[index].date!.month.toString(),
          year: news[index].date!.year.toString(),
          title: news[index].title!.rendered.toString(),
          content: news[index].content!.rendered.toString(),
          url: news[index].betterFeaturedImage!.sourceUrl!);
    },
  );
}

SizedBox dateRow(List<WordPressModel> news, int index) {
  return SizedBox(
    child: Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.watch_later,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(news[index].date!.day.toString() +
            " " +
            news[index].date!.month.toString() +
            " " +
            news[index].date!.year.toString()),
      ],
    ),
  );
}

Column newsColumn(List<WordPressModel> news, int index, BuildContext context) {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      imageBox(news, index),
      const SizedBox(
        height: 10,
      ),
      newsTitle(news, index, context),
      const SizedBox(
        height: 12,
      ),
      dateRow(news, index)
    ],
  );
}

SizedBox imageBox(List<WordPressModel> news, int index) {
  return SizedBox(
      height: 150,
      child: Image.network(
        news[index].betterFeaturedImage!.sourceUrl!,
        filterQuality: FilterQuality.low,
        fit: BoxFit.cover,
      ));
}

Padding newsTitle(List<WordPressModel> news, int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Text(
      formatHtmlString(news[index].title!.rendered.toString()),
      style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 15),
    ),
  );
}
