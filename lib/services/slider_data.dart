import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_360/models/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getslider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0d08981523a8496db787550597f3c372";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'Ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}
