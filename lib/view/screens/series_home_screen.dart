import 'package:flix_pedia/model/series_model.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../content/series/series_factory.dart';
import '../../utils/resizer/fetch_pixels.dart';
import '../widgets/commons/app_bar.dart';
import '../widgets/content_carousel_screen/build_carousel_section.dart';
import '../widgets/genres.dart';

class SeriesHomeScreen extends StatelessWidget {
  SeriesHomeScreen({super.key});

  final List<String> sectionTitles = ['Airing Today', 'All time Favorites', 'On the Air', 'Popular', ];

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
            const Genre(content: 'series',),
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding/2),
            ),
            Column(
              children: sectionTitles.asMap().entries.map((entry) {
                final index = entry.key;
                final title = entry.value;
                final series = seriesList[index];
                return buildCarouselSection(context, title, series);
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