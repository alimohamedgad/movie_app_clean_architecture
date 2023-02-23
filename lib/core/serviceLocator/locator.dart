import 'package:get_it/get_it.dart';
import '../../Tv/Data/Data_Source/remote_tv_data_source.dart';
import '../../Tv/Data/Repository/tv_repository.dart';
import '../../Tv/Domain/Repository/base_tv_repositroy.dart';
import '../../Tv/Domain/UseCase/get_tv_on_the_ait_usecase.dart';
import '../../Tv/Domain/UseCase/get_tv_popular_usecase.dart';
import '../../Tv/Domain/UseCase/get_tv_top_rated_usecase.dart';
import '../../Tv/Preseintion/Controller/Tv_Cubit/tv_cubit.dart';
import '../../Movies/Domain/UseCase/get_recomindation_usecase.dart';
import '../../Movies/Domain/UseCase/movie_details_usecase.dart';
import '../../Movies/Preseintion/Controller/Details_Bloc/movie_details_bloc.dart';
import '../../Movies/Data/Data_Source/movie_remote_data_source.dart';
import '../../Movies/Data/Repository/movie_repository.dart';
import '../../Movies/Domain/Repository/base_repository_movie.dart';
import '../../Movies/Domain/UseCase/get_now_playing_movies.dart';
import '../../Movies/Domain/UseCase/get_popular_movies.dart';
import '../../Movies/Domain/UseCase/get_top_rated_movies.dart';
import '../../Movies/Preseintion/Controller/Movie_Bloc/movie_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  init() {
    ///**  Bloc
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    ///**  Use Case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecomendtionUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    ///**  Repository
    sl.registerLazySingleton<BaseRepositoryMovies>(() => MoviceRepository(sl()));

    ///**  DataSource
    sl.registerLazySingleton<BaseRemoteMovieDataSourse>(
        () => RemoteMovieDataSourse());
  }

  initTv() {
    ///**  Bloc
    sl.registerFactory(() => TvCubit(sl(), sl(), sl()));

    ///**  Use Case
    sl.registerLazySingleton(() => GetTvOnTheAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase(sl()));

    ///**  Repository

    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    ///**  DataSource

    sl.registerLazySingleton<BaseRemoteTvDataSource>(
        () => RemoteTvDataSource());
  }
}
