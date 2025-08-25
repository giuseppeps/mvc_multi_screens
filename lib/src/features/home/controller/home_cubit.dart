import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_state.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';
import 'package:mvc_multi_screens/src/features/home/service/home_service.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _service;
  HomeCubit(this._service) : super(HomeState.initial());

  void fetchData() async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await _service.getMatches();
      emit(
        state.copyWith(
          matches: data,
          leagues: data.map((e) => e.league).toSet().toList(),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void selectLeague(LeagueModel league) async {
    emit(state.copyWith(selectedLeague: league, isLoading: true));
    try {
      final clubs = await _service.getLeagueTable(league);
      emit(state.copyWith(clubs: clubs));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void clearLeague() {
    emit(state.copyWith(selectedLeague: null, clubs: []));
  }
}
