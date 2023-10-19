import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/spacing_constants.dart';
import '../widgets/commons/app_bar.dart';
import '../widgets/commons/build_carousel_section.dart';
import '../widgets/movie_screen/carousel.dart';

class SeriesHomeScreen extends StatelessWidget {
  SeriesHomeScreen({super.key});

  final List<String> sectionTitles = ['Popular', 'Trending Now', 'Top Rated', 'Coming Soon'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context, "Movies"),
      body: SingleChildScrollView(
        child: Column(
          children: sectionTitles.map((title) => buildCarouselSection(context, title)).toList(),
        ),
      ),
    );
  }
}