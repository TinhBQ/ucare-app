import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import 'home_slide_news.dart';

class HomeNewsWidget extends StatefulWidget {
  final List<NewItem> newItems;

  const HomeNewsWidget({
    super.key,
    required this.newItems,
  });

  @override
  State<HomeNewsWidget> createState() => _HomeNewsWidgetState();
}

class _HomeNewsWidgetState extends State<HomeNewsWidget> {
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.newItems.isNotEmpty || myCurrentIndex != 0)
            Text(
              'Tin tức nổi bật',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          const SizedBox(
            height: 8,
          ),
          if (widget.newItems.isNotEmpty || myCurrentIndex != 0)
            CarouselSlider(
              items: widget.newItems
                  .map((item) => HomeSlideNews(
                        content: item.content,
                        title: item.title,
                        imagePath:
                            'https://mobile-advanced-be-r7xe.onrender.com/v1.0/api/files/image/${item.image}',
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.3,
              ),
            ),
          const SizedBox(
            height: 12,
          ),
          if (widget.newItems.isNotEmpty || myCurrentIndex != 0)
            Center(
              child: DotsIndicator(
                dotsCount: widget.newItems.length,
                position: myCurrentIndex,
                decorator: DotsDecorator(
                    color: Theme.of(context).colorScheme.secondary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    size: const Size.square(5.0),
                    activeSize: const Size(17.0, 5.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
        ],
      ),
    );
  }
}
