import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flix_pedia/routes/app_routes.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/constants/spacing_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../model/movie_model.dart';
import '../../model/series_model.dart';
import 'home_screen.dart';

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
    print(('as'));
  }

  void getData() async {
    try {
      final popularMovies = await fetchMovies('https://api.themoviedb.org/3/movie/popular', popularMoviesList);
      final trendingMovies = await fetchMovies('https://api.themoviedb.org/3/movie/now_playing', trendingMoviesList);
      final topMovies = await fetchMovies('https://api.themoviedb.org/3/movie/top_rated', topMoviesList);
      final upcomingMovies = await fetchMovies('https://api.themoviedb.org/3/movie/upcoming', upcomingMoviesList);
      final popularSeries = await fetchSeries('https://api.themoviedb.org/3/tv/popular', popularSeriesList);
      final onAirSeries = await fetchSeries('https://api.themoviedb.org/3/tv/on_the_air', onTheAirSeriesList);
      final airingTodaySeries = await fetchSeries('https://api.themoviedb.org/3/tv/airing_today', airingNowSeriesList);
      final topSeries = await fetchSeries('https://api.themoviedb.org/3/tv/top_rated', topSeriesList);
      // final series = await fetchSeries('https://api.themoviedb.org/3/tv/popular');
      print(popularMovies);
      Constant.replaceScreen(Routes.homeScreenRoute, context);
    } catch (e) {
      print('Error: $e');
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
          SpinKitChasingDots(
            color: Theme.of(context).primaryColor,
            size: 100.0,
          ),
          SizedBox(
            height: FetchPixels.getPixelHeight(kPadding*8),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
              color: kSecondaryColor
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Please Wait...'),
                WavyAnimatedText('We are fetching data for you...'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          )
        ],
      ),
    );
  }
}