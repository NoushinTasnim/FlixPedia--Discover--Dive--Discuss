import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/movie_model.dart';
import 'favorite_repository.dart';

class FirestoreMovieService implements FavoritesRepository<Movie> {
  @override
  Future<List<Movie>> fetchFavorites() async {
    var snapshot = await FirebaseFirestore.instance.collection('movies').get();
    var favourites = snapshot.docs;

    return favourites.map((document) {
        var favourite = document.data() as Map<String, dynamic>;
        // print(favourite['similar']);

        List<String> genre = (favourite['genre'] as List?)?.cast<String>() ?? [];

        return Movie(
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
  Future<void> addToFavorites(Movie movie) async {
    await FirebaseFirestore.instance.collection('movies').doc(movie.id.toString()).set({
      'title': movie.title,
      'numOfRatings': movie.numOfRatings,
      'criticsReview':movie.criticsReview ,
      'metascoreRating': movie.metascoreRating,
      'rating': movie.rating,
      'genre': movie.genre,
      'year': movie.year,
      'plot': movie.plot,
      'poster': movie.poster,
      'backdrop': movie.backdrop,
      'runtime': movie.runtime,
      'cast': movie.cast,
      'similar': movie.similar,
      'id': movie.id
    });
  }

  Future<bool> isAlreadyFavourite(Movie movie) async{
    var movieDoc = FirebaseFirestore.instance.collection('movies').doc(movie.id.toString());

    var existingMovie = await movieDoc.get();
    if (existingMovie.exists) {
      return true;
    }
    return false;
  }

  @override
  Future<void> removeFromFavorites(String movieID) async {
    await FirebaseFirestore.instance.collection('movies').doc(movieID).delete();
  }
}