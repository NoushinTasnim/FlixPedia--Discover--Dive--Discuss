import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/series_model.dart';
import 'favorite_repository.dart';

class FirestoreSeriesService implements FavoritesRepository<Series> {
  @override
  Future<List<Series>> fetchFavorites() async {
    var snapshot = await FirebaseFirestore.instance.collection('series').get();
    var favourites = snapshot.docs;

    return favourites.map((document) {
      var favourite = document.data() as Map<String, dynamic>;

      List<String> genre = (favourite['genre'] as List?)?.cast<String>() ?? [];

      return Series(
        runtime: favourite['runtime'],
        poster: favourite['poster'],
        backdrop: favourite['backdrop'],
        title: favourite['title'],
        id: favourite['id'],
        year: favourite['year'],
        numOfRatings: favourite['numOfRatings'],
        criticsReview: favourite['criticsReview'],
        metascoreRating: favourite['metascoreRating'],
        rating: favourite['rating'],
        genre: genre,
        plot: favourite['plot'],
        cast: (favourite['cast'] as List).map((castMember) => {
          'orginalName': castMember['orginalName'],
          'movieName': castMember['movieName'],
          'image': castMember['image'],
        }).toList(),
        similar: (favourite['similar'] as List).map((sim) => {
          'title': sim['title'],
          'poster': sim['poster'],
        }).toList(),
      );
    }).toList();
  }

  @override
  Future<void> addToFavorites(Series series) async {
    await FirebaseFirestore.instance.collection('series').doc(series.id.toString()).set({
      'title': series.title,
      'numOfRatings': series.numOfRatings,
      'criticsReview':series.criticsReview ,
      'metascoreRating': series.metascoreRating,
      'rating': series.rating,
      'genre': series.genre,
      'year': series.year,
      'plot': series.plot,
      'poster': series.poster,
      'backdrop': series.backdrop,
      'runtime': series.runtime,
      'cast': series.cast,
      'similar': series.similar,
      'id': series.id
    });
  }

  @override
  Future<bool> isAlreadyFavourite(Series series) async{
    var seriesDoc = FirebaseFirestore.instance.collection('series').doc(series.id.toString());

    var existingSeries = await seriesDoc.get();
    if (existingSeries.exists) {
      return true;
    }
    return false;
  }

  @override
  Future<void> removeFromFavorites(String seriesID) async {
    await FirebaseFirestore.instance.collection('series').doc(seriesID).delete();
  }
}