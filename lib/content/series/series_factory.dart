import 'package:flix_pedia/content/series/series_genre.dart';
import 'package:flix_pedia/model/series_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

const _apiKey = '5f80bc0b10a444db9c045e07de26b900';
const _mainUrl = 'https://api.themoviedb.org/3/tv';

abstract class SeriesFetcher {
  Future<List<Series>> fetchSeries();
}

class SeriesFactory {
  final String baseUrl;
  final String apiKey;

  SeriesFactory(this.baseUrl, this.apiKey);

  SeriesFetcher createFetcher(String type) {
    switch (type) {
      case 'popular':
        return PopularSeriesFetcher(baseUrl, apiKey);
      case 'top_rated':
        return TopRatedSeriesFetcher(baseUrl, apiKey);
      case 'airing_today':
        return AiringTodaySeriesFetcher(baseUrl, apiKey);
      case 'on_the_air':
        return OnAirSeriesFetcher(baseUrl, apiKey);
      default:
        throw Exception('Invalid series type');
    }
  }
}

class SeriesApi {
  SeriesApi();

  Future<List<Series>> fetchSeries(String type) async {
    final factory = SeriesFactory(_mainUrl, _apiKey);
    final fetcher = factory.createFetcher(type);
    return await fetcher.fetchSeries();
  }
}

class SeriesFetcherBase implements SeriesFetcher {
  final String baseUrl;
  final String apiKey;

  SeriesFetcherBase(this.baseUrl, this.apiKey);

  Future<List<Series>> processSeries(List<dynamic> results) async {
    List<Series> series = [];

    await Future.wait(results.map((seriesData) async {
      final List<dynamic> genreData = seriesData['genre_ids'];
      final List<String> genres =
      genreData.map((genreId) => SeriesGenreService().getGenreName(genreId).toString()).toList();

      final castResponse = await http.get(Uri.parse('$_mainUrl/${seriesData['id']}/aggregate_credits?api_key=$_apiKey'));
      final castJsonResponse = json.decode(castResponse.body);

      final similarRes = await http.get(Uri.parse('$_mainUrl/${seriesData['id']}/similar?api_key=$_apiKey'));
      final similarJsonResponse = json.decode(similarRes.body);

      final List<dynamic> similarData = similarJsonResponse['results'];
      final List<dynamic> castData = castJsonResponse['cast'];

      final seriesRes = await http.get(Uri.parse('$_mainUrl/${seriesData['id']}?api_key=$_apiKey'));
      final seriesResponse = json.decode(seriesRes.body);

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
    }));

    return series;
  }

  @override
  Future<List<Series>> fetchSeries() async {
    List<Series> series = [];
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      series = await processSeries(results);
    } else {
      throw Exception('Failed to fetch series');
    }

    return series;
  }
}

class PopularSeriesFetcher extends SeriesFetcherBase {
  PopularSeriesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/popular', apiKey);
}

class TopRatedSeriesFetcher extends SeriesFetcherBase {
  TopRatedSeriesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/top_rated', apiKey);
}

class AiringTodaySeriesFetcher extends SeriesFetcherBase {
  AiringTodaySeriesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/airing_today', apiKey);
}

class OnAirSeriesFetcher extends SeriesFetcherBase {
  OnAirSeriesFetcher(String baseUrl, String apiKey) : super(baseUrl + '/on_the_air', apiKey);
}
