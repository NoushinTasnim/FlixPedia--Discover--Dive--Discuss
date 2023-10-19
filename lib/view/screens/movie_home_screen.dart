import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flix_pedia/view/widgets/commons/app_bar.dart';
import '../../utils/constants/color_constants.dart';
import '../widgets/commons/build_carousel_section.dart';

class MovieHomeScreen extends StatelessWidget {
  MovieHomeScreen({super.key});

  final List<String> sectionTitles = ['Popular', 'Trending Now', 'Top Rated', 'Coming Soon'];

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
              height: FetchPixels.getPixelHeight(kPadding*2),
            ),
            Column(
              children: sectionTitles.map((title) => buildCarouselSection(context, title)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}