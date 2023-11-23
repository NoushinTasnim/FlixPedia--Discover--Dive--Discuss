abstract class FavoritesRepository<T> {
  Future<List<T>> fetchFavorites();

  Future<void> addToFavorites(T content);

  Future<bool> isAlreadyFavourite(T content);

  Future<void> removeFromFavorites(String movieId);
}
