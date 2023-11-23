import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flix_pedia/content/movies/movie_factory.dart';
import 'package:flix_pedia/routes/app_routes.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/constants/spacing_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import '../../model/movie_facts.dart';
import '../../content/series/series_factory.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  double value = 0.0;

  Future<void> callMovieAPIs() async {
    final movieAPI = MovieApi();
    popularMoviesList = await movieAPI.fetchMovies('popular');

    setState(() {
      value = 1/8.0;
    });

    topMoviesList = await movieAPI.fetchMovies('top_rated');
    setState(() {
      value = 2/8.0;
    });

    upcomingMoviesList = await movieAPI.fetchMovies('upcoming');
    setState(() {
      value = 3/8.0;
    });

    trendingMoviesList = await movieAPI.fetchMovies('now_playing');
    setState(() {
      value = 0.5;
    });
  }

  Future<void> callSeriesAPIs() async {
    final seriesApi = SeriesApi();
    popularSeriesList = await seriesApi.fetchSeries('popular');

    setState(() {
      value = 5/8.0;
    });

    topSeriesList = await seriesApi.fetchSeries('top_rated');
    setState(() {
      value = 6/8.0;
    });

    airingNowSeriesList = await seriesApi.fetchSeries('airing_today');
    setState(() {
      value = 7/8.0;
    });

    onTheAirSeriesList = await seriesApi.fetchSeries('on_the_air');
    setState(() {
      value = 1.0;
    });
  }

  void getData() async {
    try {
      await callMovieAPIs();
      await callSeriesAPIs();
      Constant.replaceScreen(Routes.homeScreenRoute, context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: LiquidCircularProgressIndicator(
                value: value,
                valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                direction: Axis.vertical,
                center: Text(
                    "${value*100} %",
                    style: TextStyle(
                      color: Theme.of(context).hoverColor
                    ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: FetchPixels.getPixelHeight(kPadding*8),
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).primaryColor
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                for (String text in movieFacts)
                  WavyAnimatedText(
                    text,
                    speed: Duration(milliseconds: 100)
                  ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
              onTap: () {
              },
            ),
          )
        ],
      ),
    );
  }
}