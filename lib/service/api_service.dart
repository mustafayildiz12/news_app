import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/news.dart';
import '../models/news_categories_model.dart';
import '../models/wordpress_model.dart';

class Service {
  final String _wrodpressUrl =
      "https://deneme.kitabya.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100";

  final String articleUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=ac2691bc62484fa9a09aeaac78637cd2";

  Future<List<WordPressModel>> getNews() async {
    Response res = await http.get(Uri.parse(_wrodpressUrl),
        headers: {"Accept": "application/json", "Connection": "Keep-Alive"});

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      return wordPressModelFromJson(res.body);
    } else {
      throw ("Can't get the News");
    }
  }

  Future<List<NewsCategoriesModel>> getCategories() async {
    Response res = await http.get(Uri.parse(_wrodpressUrl + "/categories"),
        headers: {"Accept": "application/json", "Connection": "Keep-Alive"});

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      return newsCategoriesModelFromJson(res.body);
    } else {
      throw ("Can't get the Categories");
    }
  }

  Future<List<Article>> getArticle() async {
    Response res = await http.get(Uri.parse(articleUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
