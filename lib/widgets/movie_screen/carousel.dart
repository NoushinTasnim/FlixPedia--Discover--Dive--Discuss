import 'dart:math';
import 'package:flix_pedia/utils/constants.dart';
import 'package:flix_pedia/widgets/movie_screen/movie_image.dart';
import 'package:flix_pedia/widgets/movie_screen/movie_rating.dart';
import 'package:flix_pedia/widgets/movie_screen/movie_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'movie_card.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPadding/2),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) => buildMovieCard(index)
        ),
      ),
    );
  }

  Widget buildMovieCard(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if(_pageController.position.haveDimensions){
        value = index - (_pageController.page)!.toDouble();
        value = (value * 0.1).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: initialPage == index ? 1 : 0.25,
        child: Transform.rotate(
          angle: pi*value,
          child: MovieCard(),
        ),
      );
    },
  );
}