import 'dart:math';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import '../../../model/movie_model.dart';
import 'movie_card.dart';

class Carousel extends StatefulWidget {
  Carousel({super.key, required this.contentList});

  var contentList;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  late PageController _pageController;
  int initialPage = 1;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.5,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(kPadding/2)),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: widget.contentList.length,
            itemBuilder: (context, index) => buildMovieCard(index)
        ),
      ),
    );
  }

  Widget buildMovieCard(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if (_pageController.position.haveDimensions) {
        value = index - _pageController.page!;
        value = (value ).clamp(-1, 1);
      }
      double scale = 1 - (value.abs() * 0.33); // Adjust the scale factor as desired

      return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: initialPage == index ? 1 : 0.25,
        child: Transform.scale(
          scale: scale,
          child: Transform.rotate(
            angle: pi * value/18,
            child: MovieCard(
              content: widget.contentList[index],
            ),
          ),
        ),
      );
    },
  );
}