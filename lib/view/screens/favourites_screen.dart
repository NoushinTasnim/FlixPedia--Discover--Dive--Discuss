import 'package:flix_pedia/view/widgets/commons/app_bar.dart';
import 'package:flix_pedia/view/widgets/content_carousel_screen/carousel.dart';
import 'package:flutter/material.dart';

import '../../firestore/firestore_repository_movies.dart';
import '../../firestore/firestore_reposity_series.dart';
import '../../model/movie_model.dart';
import '../../model/series_model.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Movie> movies = [];
  List<Series> series = [];

  @override
  void initState() {
    super.initState();
    _fetchContents();
  }

  Future<void> _fetchContents() async {
    var movieRepository = FirestoreMovieService();
    var fetchedMovies = await movieRepository.fetchFavorites();

    var seriesRepository = FirestoreSeriesService();
    var fetchedSeries = await seriesRepository.fetchFavorites();
    setState(() {
      movies = fetchedMovies;
      series = fetchedSeries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Favourites'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Movies',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Carousel(contentList: movies,),
            Text(
              'Series',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Carousel(contentList: series,),
          ],
        ),
      )
    );
  }
}
