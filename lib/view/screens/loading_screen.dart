import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flix_pedia/routes/app_routes.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/constants/spacing_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import '../../model/movie_model.dart';
import '../../model/series_model.dart';

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
    print(await fetchMovies('https://api.themoviedb.org/3/movie/popular', popularMoviesList));
    print('objectas');
    setState(() {
      value = 1/8.0;
    });
    print(await fetchMovies('https://api.themoviedb.org/3/movie/now_playing', trendingMoviesList));
    print('objectas');
    setState(() {
      value = 2/8.0;
    });
    await fetchMovies('https://api.themoviedb.org/3/movie/top_rated', topMoviesList);
    print('objectas');
    setState(() {
      value = 3/8.0;
    });
    await fetchMovies('https://api.themoviedb.org/3/movie/upcoming', upcomingMoviesList);
    setState(() {
      value = 4/8.0;
    });
  }

  Future<void> callSeriesAPIs() async {
    await fetchSeries('https://api.themoviedb.org/3/tv/popular', popularSeriesList);
    setState(() {
      value = 5/8.0;
    });
    print('objectas');
    await fetchSeries('https://api.themoviedb.org/3/tv/on_the_air', onTheAirSeriesList);
    setState(() {
      value = 6/8.0;
    });
    print('objectas');
    await fetchSeries('https://api.themoviedb.org/3/tv/airing_today', airingNowSeriesList);
    setState(() {
      value = 7/8.0;
    });
    print('objectas');
    await fetchSeries('https://api.themoviedb.org/3/tv/top_rated', topSeriesList);
    setState(() {
      value = 1.0;
    });
    print('objectas');

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
            child: Container(
              height: 200,
              width: 200,
              child: LiquidCircularProgressIndicator(
                value: value, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor), // Defaults to the current Theme's accentColor.
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1), // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text(
                    "${value*100} %",
                    style: TextStyle(
                      color: Theme.of(context).hoverColor
                    ),
                ),
              ),
            ),
          ),
          // SpinKitChasingDots(
          //   color: Theme.of(context).primaryColor,
          //   size: 100.0,
          // ),
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
                WavyAnimatedText('Please Wait...'),
                WavyAnimatedText('We are fetching data for you...'),
                WavyAnimatedText('It takes some time...'),
                WavyAnimatedText('We appreciate your patience...'),
                WavyAnimatedText('Hold on for a bit...'),
                WavyAnimatedText('A few more seconds...'),
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