import 'dart:math';
import 'package:flutter/material.dart';
import '../movie_screen/movie_card.dart';

Widget buildMovieCard(int index, PageController pageController, int initialPage) => AnimatedBuilder(
  animation: pageController,
  builder: (context, child) {
    double value = 0;
    if (pageController.position.haveDimensions) {
      value = index - pageController.page!;
      value = (value ).clamp(-1, 1);
    }
    double scale = 1 - (value.abs() * 0.25); // Adjust the scale factor as desired

    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: initialPage == index ? 1 : 0.25,
      child: Transform.scale(
        scale: scale,
        child: Transform.rotate(
          angle: pi * value/18,
          child: MovieCard(),
        ),
      ),
    );
  },
);