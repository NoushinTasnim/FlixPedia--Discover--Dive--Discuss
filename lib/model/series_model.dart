// Our series model
import 'package:http/http.dart' as http;
import 'dart:convert';

class Series {
  final int id, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genre;
  final String plot, title, poster, backdrop, year;
  final List<Map> cast;
  final List<Map> similar;
  final String runtime;

  Series( {
    required this.runtime,
    required this.poster,
    required this.backdrop,
    required this.similar,
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
List<Map<String, dynamic>> genresList = [
  {
    "id": 10759,
    "name": "Action & Adventure"
  },
  {
    "id": 16,
    "name": "Animation"
  },
  {
    "id": 35,
    "name": "Comedy"
  },
  {
    "id": 80,
    "name": "Crime"
  },
  {
    "id": 99,
    "name": "Documentary"
  },
  {
    "id": 18,
    "name": "Drama"
  },
  {
    "id": 10751,
    "name": "Family"
  },
  {
    "id": 10762,
    "name": "Kids"
  },
  {
    "id": 9648,
    "name": "Mystery"
  },
  {
    "id": 10763,
    "name": "News"
  },
  {
    "id": 10764,
    "name": "Reality"
  },
  {
    "id": 10765,
    "name": "Sci-Fi & Fantasy"
  },
  {
    "id": 10766,
    "name": "Soap"
  },
  {
    "id": 10767,
    "name": "Talk"
  },
  {
    "id": 10768,
    "name": "War & Politics"
  },
  {
    "id": 37,
    "name": "Western"
  }
];

List<Series> popularSeriesList = [];
List<Series> onTheAirSeriesList = [];
List<Series> topSeriesList = [];
List<Series> airingNowSeriesList = [];

List<List<Series>> seriesList = [
  airingNowSeriesList,
  topSeriesList,
  onTheAirSeriesList,
  popularSeriesList,
];

String getGenreName(int genreId) {
  final genre = genresList.firstWhere(
        (element) => element['id'] == genreId,
    orElse: () => <String, dynamic>{},
  );
  return genre.isNotEmpty ? genre['name'] : 'Unknown';
}

const apiKey = '5f80bc0b10a444db9c045e07de26b900';
const mainUrl = 'https://api.themoviedb.org/3';

Future<Iterable<void>> fetchSeries(String url, List<Series> series) async {
  series.clear();
  final response = await http.get(Uri.parse('$url?api_key=$apiKey'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final List<dynamic> results = jsonResponse['results'];

    return Future.wait(results.map((seriesData) async {
      final List<dynamic> genreData = seriesData['genre_ids'];
      final List<String> genres = genreData.map((genreId) => getGenreName(genreId).toString()).toList();

      final castResponse = await http.get(Uri.parse('$mainUrl/tv/${seriesData['id']}/aggregate_credits?api_key=$apiKey'));
      final castJsonResponse = json.decode(castResponse.body);

      final similarRes = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/${seriesData['id']}/similar?api_key=$apiKey'));
      final similarJsonResponse = json.decode(similarRes.body);

      // print(similarJsonResponse);

      final List<dynamic> similarData = similarJsonResponse['results'];
      final List<dynamic> castData = castJsonResponse['cast'];

      final seriesRes = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/${seriesData['id']}?api_key=$apiKey'));
      final seriesResponse = json.decode(seriesRes.body);
      // print(seriesResponse);

      series.add(Series(
        runtime: seriesResponse['number_of_seasons'].toString() + seriesResponse['number_of_episodes'].toString(),
        poster: 'https://image.tmdb.org/t/p/w500${seriesData['poster_path']}',
        backdrop: 'https://image.tmdb.org/t/p/w500${seriesData['backdrop_path']}',
        title: seriesData['name'],
        id: seriesData['id'],
        year: seriesResponse['first_air_date'].toString(),
        numOfRatings: seriesData['vote_count'],
        criticsReview: seriesData['vote_average'].toInt(),
        metascoreRating: seriesData['popularity'].toInt(),
        rating: seriesData['vote_average'].toDouble(),
        genre: genres,
        plot: seriesData['overview'],
        cast: castData.map((castMember) => {
          'orginalName': castMember['name'],
          'movieName': castMember['roles'][0]['character'],
          'image': 'https://image.tmdb.org/t/p/w500${castMember['profile_path']}',
        }).toList(),
        similar: similarData.map((sim) => {
          'title': sim['name'],
          'poster': 'https://image.tmdb.org/t/p/w500${sim['poster_path']}',
        }).toList(),
      ));
      // print(series[series.length-1].similar);
    }));
  } else {
    throw Exception('Failed to fetch series');
  }
}