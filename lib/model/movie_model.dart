import 'package:flix_pedia/content/movies/movie_genre.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie {
  final int id;
  final int numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genre;
  final String year;
  final String plot;
  final String title, poster, backdrop;
  final List<Map<String, dynamic>> cast;
  final List<Map<String, dynamic>> similar;
  final String runtime;

  Movie({
    required this.similar,
    required this.runtime,
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genre,
    required this.plot,
    required this.cast,
  });
}