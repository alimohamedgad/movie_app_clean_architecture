import 'package:dio/dio.dart';
import '../Model/recomindtion_model.dart';
import '../../Domain/UseCase/get_recomindation_usecase.dart';
import '../Model/movie_details_model.dart';
import '../../Domain/UseCase/movie_details_usecase.dart';
import '../Model/movie_model.dart';
import '../../../core/constans/api_constans.dart';
import '../../../core/erorr/exepections.dart';
import '../../../core/modelErorr/movice_model_erorr.dart';

abstract class BaseRemoteMovieDataSourse {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters movieDetailParameters);

  Future<List<RecomindtionModel>> getRecomindtionMovie(
      RecomindtionParameter parameter);
}

class RemoteMovieDataSourse extends BaseRemoteMovieDataSourse {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServiceExpaetion(
        errorMessgeModel: ErrorMessgeMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServiceExpaetion(
        errorMessgeModel: ErrorMessgeMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServiceExpaetion(
        errorMessgeModel: ErrorMessgeMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters movieDetailParameters) async {
    final response = await Dio()
        .get(ApiConstance.movieDetailsPath(movieDetailParameters.movieID));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServiceExpaetion(
        errorMessgeModel: ErrorMessgeMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecomindtionModel>> getRecomindtionMovie(
      RecomindtionParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.recomindtionPath(parameter.movieId));
    if (response.statusCode == 200) {
      return List<RecomindtionModel>.from(
          (response.data['results'] as List).map(
        (e) => RecomindtionModel.fromJson(e),
      ));
    } else {
      throw ServiceExpaetion(
        errorMessgeModel: ErrorMessgeMode.fromJson(response.data),
      );
    }
  }
}
