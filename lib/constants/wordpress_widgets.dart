import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/string_constant.dart';

import '../models/wordpress_model.dart';
import '../ui/detail_news.dart';

OpenContainer<Object?> openContainer(
    List<WordPressModel> news, int index, BuildContext context) {
  return OpenContainer(
    transitionDuration: const Duration(milliseconds: 600),
    transitionType: ContainerTransitionType.fadeThrough,
    closedBuilder: (BuildContext _, VoidCallback openContainer) {
      return listTileCard(
          openContainer, news, index, formatHtmlString, context);
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

Container listTileCard(
    VoidCallback openContainer,
    List<WordPressModel> news,
    int index,
    String Function(String string) formatHtmlString,
    BuildContext context) {
  return Container(
    color: Theme.of(context).cardColor,
    child: ListTile(
      tileColor: Theme.of(context).cardColor,
      focusColor: Theme.of(context).cardColor,
      onTap: openContainer,
      leading: imageBox(news, index),
      title: titleText(formatHtmlString, news, index, context),
    ),
  );
}

SizedBox imageBox(List<WordPressModel> news, int index) {
  return SizedBox(
    width: 100,
    height: 75,
    child: Image.network(
      news[index].betterFeaturedImage!.sourceUrl!,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
    ),
  );
}

Text titleText(String Function(String string) formatHtmlString,
    List<WordPressModel> news, int index, BuildContext context) {
  return Text(
    formatHtmlString(news[index].title!.rendered.toString()),
    style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 17),
  );
}
