import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=7d2e3e35086e453bb9fc292e517c25f3";
    var response = await http.get(url);
//    print(response.body);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
//        print(element);
        if (element["urlToImage"] != null && element["description"] != null) {
//          print(element);
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              author: element['author']);
          print(articleModel);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/everything?category=$category&country=in&apiKey=7d2e3e35086e453bb9fc292e517c25f3";
    var response = await http.get(url);
//    print(response.body);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
//        print(element);
        if (element["urlToImage"] != null && element["description"] != null) {
//          print(element);
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              author: element['author']);
          print(articleModel);
          news.add(articleModel);
        }
      });
    }
  }
}
