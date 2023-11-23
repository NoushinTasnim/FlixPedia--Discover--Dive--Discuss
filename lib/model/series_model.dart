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