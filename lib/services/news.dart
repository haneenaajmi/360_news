import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_360/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-11-20&sortBy=publishedAt&apiKey=0d08981523a8496db787550597f3c372";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'Ok') {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"]!=null && element['description']!= null){
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
