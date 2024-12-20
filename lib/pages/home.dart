// import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_360/models/category_model.dart';
import 'package:news_app_360/models/slider_model.dart';
import 'package:news_app_360/services/data.dart';
import 'package:news_app_360/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("360"),
            Text("News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 70,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].Image,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            ),
            SizedBox(height: 30),
            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realindex) {
                String? res = sliders[index].image;
                String? res1 = sliders[index].name;
                return buildImage(res!, index, res1!);
              },
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10.0),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            // height: 250,
            padding: EdgeInsets.only(left: 10.0),
            margin: EdgeInsets.only(top: 150.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ]),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: JumpingDotEffect(
            dotWidth: 10, dotHeight: 10, activeDotColor: Colors.black),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
