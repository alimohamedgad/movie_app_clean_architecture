// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movice_app_clean_architecture/Tv/Domain/UseCase/get_tv_on_the_ait_usecase.dart';
import 'package:movice_app_clean_architecture/Tv/Domain/UseCase/get_tv_popular_usecase.dart';
import 'package:movice_app_clean_architecture/Tv/Domain/UseCase/get_tv_top_rated_usecase.dart';
import 'package:movice_app_clean_architecture/Tv/Preseintion/Controller/Tv_Cubit/tv_state.dart';
import 'package:movice_app_clean_architecture/core/modelErorr/enums.dart';

class TvCubit extends Cubit<TvState> {
  final GetTvOnTheAirUseCase getTvOnTheAirUseCase;
  final GetTvPopularUseCase getTvPopularUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;
  TvCubit(
    this.getTvOnTheAirUseCase,
    this.getTvPopularUseCase,
    this.getTvTopRatedUseCase,
  ) : super(const TvState());

  void getTvOnTheAir() async {
    final data = await getTvOnTheAirUseCase();
    data.fold(
      (l) => emit(
        state.copyWith(
          tvOnTheAirSmessege: l.messege,
          tvOnTheAirState: RequestState.erorr,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvOnTheAirSlist: r,
          tvOnTheAirState: RequestState.loaded,
        ),
      ),
    );
  }

  void getTvPopular() async {
    final data = await getTvPopularUseCase();
    data.fold(
      (l) => emit(
        state.copyWith(
          tvPopularMessage: l.messege,
          tvPopularState: RequestState.erorr,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvPopularList: r,
          tvPopularState: RequestState.loaded,
        ),
      ),
    );
  }

  void getTvTopRated() async {
    final data = await getTvTopRatedUseCase();
    data.fold(
      (l) => emit(
        state.copyWith(
          tvTopRatedMassege: l.messege,
          tvTopRatedState: RequestState.erorr,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvTopRatedList: r,
          tvTopRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
