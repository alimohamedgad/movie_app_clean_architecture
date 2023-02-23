class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '8a29fa5d88326d322f54f781f946b211';
  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String recomindtionPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String? path) =>
      'https://image.tmdb.org/t/p/w500/$path';
}

class TvApiConstans {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '8a29fa5d88326d322f54f781f946b211';


  static const String onTheAirTvPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const String topRatedTvPath = '$baseUrl/tv/top_rated?api_key=$apiKey';
  static const String popularTvPath = '$baseUrl/tv/popular?api_key=$apiKey';
}
