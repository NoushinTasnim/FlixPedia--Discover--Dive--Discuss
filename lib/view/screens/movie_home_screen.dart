import 'package:flix_pedia/model/movie_model.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flix_pedia/view/widgets/commons/app_bar.dart';
import '../widgets/commons/build_carousel_section.dart';
import '../widgets/genres.dart';

class MovieHomeScreen extends StatelessWidget {
  MovieHomeScreen({super.key});

  final List<String> sectionTitles = ['Trending Now', 'Coming Soon', 'Popular', 'Top Rated'];

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context, "Movies"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding),
            ),
            Genre(),
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding/2),
            ),
            Column(
              children: sectionTitles.asMap().entries.map((entry) {
                final index = entry.key;
                final title = entry.value;
                final movie = movieList[index];
                return buildCarouselSection(context, title, movie);
              }).toList(),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding*1.5),
            )
          ],
        ),
      ),
    );
  }
}