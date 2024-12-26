import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_360/models/article_model.dart';
import 'package:news_app_360/models/slider_model.dart';
import 'package:news_app_360/pages/article_view.dart';
import 'package:news_app_360/services/news.dart';
import 'package:news_app_360/services/slider_data.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
   void initState() {

    getSlider();
    getNews();
    super.initState();
  }
  
  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
  }

  getSlider() async {
    Sliders Slider = Sliders();
    await Slider.getslider();
    sliders = Slider.sliders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}


class AllNewsSection extends StatelessWidget {
  String Image, desc, title,url;
  AllNewsSection({required this.Image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.9),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
              maxLines: 3,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
