import 'package:flix_pedia/model/movie_model.dart';
import 'package:flix_pedia/content/movies/movie_genre.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Movie> popularMoviesList = [];
List<Movie> trendingMoviesList = [];
List<Movie> topMoviesList = [];
List<Movie> upcomingMoviesList = [];

List<List<Movie>> movieList = [
  trendingMoviesList,
  upcomingMoviesList,
  popularMoviesList,
  topMoviesList,
];

const _apiKey = '5f80bc0b10a444db9c045e07de26b900';
const _mainUrl = 'https://api.themoviedb.org/3/movie';

abstract class MovieFetcher {
  Future<List<Movie>> fetchMovies();
}

class MovieFactory {
  final String baseUrl;
  final String apiKey;

  MovieFactory(this.baseUrl, this.apiKey);

  MovieFetcher createFetcher(String type) {
    switch (type) {
      case 'popular':
        return PopularMoviesFetcher(baseUrl, apiKey);
      case 'now_playing':
        return TrendingMoviesFetcher(baseUrl, apiKey);
      case 'upcoming':
        return UpcomingMoviesFetcher(baseUrl, apiKey);
      case 'top_rated':
        return TopRatedMoviesFetcher(baseUrl, apiKey);
      default:
        throw Exception('Invalid movie type');
    }
  }
}

class MovieApi {
  MovieApi();

  Future<List<Movie>> fetchMovies(String type) async {
    final factory = MovieFactory(_mainUrl, _apiKey);
    final fetcher = factory.createFetcher(type);
    return await fetcher.fetchMovies();
  }
}

class MovieFetcherBase implements MovieFetcher {
  final String baseUrl;
  final String apiKey;

  MovieFetcherBase(this.baseUrl, this.apiKey);

  Future<List<Movie>> processMovies(List<dynamic> results) async {
    List<Movie> movies = [];

    await Future.wait(results.map((movieData) async {
      final List<dynamic> genreData = movieData['genre_ids'];
      final List<String> genres =
      genreData.map((genreId) => MovieGenreService().getGenreName(genreId).toString()).toList();

      final castResponse =
      await http.get(Uri.parse('$_mainUrl/${movieData['id']}/credits?api_key=$apiKey'));
      final castJsonResponse = json.decode(castResponse.body);

      final similarRes =
      await http.get(Uri.parse('$_mainUrl/${movieData['id']}/similar?api_key=$apiKey'));
      final similarJsonResponse = json.decode(similarRes.body);

      final List<dynamic> castData = castJsonResponse['cast'];
      final List<dynamic> similarData = similarJsonResponse['results'];

      final movieRes = await http.get(Uri.parse('$_mainUrl/${movieData['id']}?api_key=$apiKey'));
      final movieResponse = json.decode(movieRes.body);

      movies.add(
        Movie(
          runtime: movieResponse['runtime'].toString(),
          poster: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
          backdrop: 'https://image.tmdb.org/t/p/w500${movieData['backdrop_path']}',
          title: movieData['title'],
          id: movieData['id'],
          year: movieResponse['release_date'],
          numOfRatings: movieData['vote_count'],
          criticsReview: movieData['vote_average'].toInt(),
          metascoreRating: movieData['popularity'].toInt(),
          rating: double.parse(movieData['vote_average'].toStringAsFixed(1)),
          genre: genres,
          plot: movieData['overview'],
          cast: castData.map((castMember) => {
            'orginalName': castMember['name'],
            'movieName': castMember['character'],
            'image': 'https://image.tmdb.org/t/p/w500${castMember['profile_path']}',
          }).toList(),
          similar: similarData.map((sim) => {
            'title': sim['title'],
            'poster': 'https://image.tmdb.org/t/p/w500${sim['poster_path']}',
          }).toList(),
        ),
      );
    }));

    return movies;
  }

  @override
  Future<List<Movie>> fetchMovies() async {
    List<Movie> movies = [];
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      movies = await processMovies(results);
    } else {
      throw Exception('Failed to fetch movies');
    }

    return movies;
  }
}

class PopularMoviesFetcher extends MovieFetcherBase {
  PopularMoviesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/popular', apiKey);
}

class TrendingMoviesFetcher extends MovieFetcherBase {
  TrendingMoviesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/now_playing', apiKey);
}

class UpcomingMoviesFetcher extends MovieFetcherBase {
  UpcomingMoviesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/upcoming', apiKey);
}

class TopRatedMoviesFetcher extends MovieFetcherBase {
  TopRatedMoviesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/top_rated', apiKey);
}
