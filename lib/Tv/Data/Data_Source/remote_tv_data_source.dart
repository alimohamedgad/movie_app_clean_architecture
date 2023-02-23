import 'package:dio/dio.dart';
import '../Model/tv_model.dart';
import '../../../core/constans/api_constans.dart';
import '../../../core/erorr/exepections.dart';
import '../../../core/modelErorr/movice_model_erorr.dart';

abstract class BaseRemoteTvDataSource {
  Future<List<TvModel>> getTvOnTheAir();
  Future<List<TvModel>> getTvTopRated();
  Future<List<TvModel>> getTvPopular();
}

class RemoteTvDataSource extends BaseRemoteTvDataSource {
  @override
  Future<List<TvModel>> getTvOnTheAir() async {
    final response = await Dio().get(TvApiConstans.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e),),);
    } else {
      throw ServiceExpaetion(
          errorMessgeModel: ErrorMessgeMode.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvPopular() async {
    final response = await Dio().get(TvApiConstans.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServiceExpaetion(
          errorMessgeModel: ErrorMessgeMode.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvTopRated() async {
    final response = await Dio().get(TvApiConstans.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServiceExpaetion(
          errorMessgeModel: ErrorMessgeMode.fromJson(response.data));
    }
  }
}
