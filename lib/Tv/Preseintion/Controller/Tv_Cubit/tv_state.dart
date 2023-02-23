// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movice_app_clean_architecture/Tv/Domain/Entities/tv.dart';
import 'package:movice_app_clean_architecture/core/modelErorr/enums.dart';

class TvState extends Equatable {
  final List<TV> tvOnTheAirSlist;
  final RequestState tvOnTheAirState;
  final String tvOnTheAirSmessege;
  final List<TV> tvPopularList;
  final RequestState tvPopularState;
  final String tvPopularMessage;
  final List<TV> tvTopRatedList;
  final RequestState tvTopRatedState;
  final String tvTopRatedMassege;

  const TvState({
    this.tvOnTheAirSlist = const [],
    this.tvOnTheAirState = RequestState.loading,
    this.tvOnTheAirSmessege = '',
    this.tvPopularList = const [],
    this.tvPopularState = RequestState.loading,
    this.tvPopularMessage = '',
    this.tvTopRatedList = const [],
    this.tvTopRatedState = RequestState.loading,
    this.tvTopRatedMassege = '',
  });

  TvState copyWith({
    List<TV>? tvOnTheAirSlist,
    RequestState? tvOnTheAirState,
    String? tvOnTheAirSmessege,
    List<TV>? tvPopularList,
    RequestState? tvPopularState,
    String? tvPopularMessage,
    List<TV>? tvTopRatedList,
    RequestState? tvTopRatedState,
    String? tvTopRatedMassege,
  }) {
    return TvState(
      tvOnTheAirSlist: tvOnTheAirSlist ?? this.tvOnTheAirSlist,
      tvOnTheAirState: tvOnTheAirState ?? this.tvOnTheAirState,
      tvOnTheAirSmessege: tvOnTheAirSmessege ?? this.tvOnTheAirSmessege,
      tvPopularList: tvPopularList ?? this.tvPopularList,
      tvPopularMessage: tvPopularMessage ?? this.tvPopularMessage,
      tvPopularState: tvPopularState ?? this.tvPopularState,
      tvTopRatedList: tvTopRatedList ?? this.tvTopRatedList,
      tvTopRatedState: tvTopRatedState ?? this.tvTopRatedState,
      tvTopRatedMassege: tvTopRatedMassege ?? this.tvTopRatedMassege,
    );
  }

  @override
  List<Object> get props {
    return [
      tvOnTheAirSlist,
      tvOnTheAirState,
      tvOnTheAirSmessege,
      tvPopularList,
      tvPopularState,
      tvPopularMessage,
      tvTopRatedList,
      tvTopRatedState,
      tvTopRatedMassege,
    ];
  }
}
