import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class HomeState {
  final bool isLoading;
  final List<MatchModel> matches;
  final List<LeagueModel> leagues;
  final LeagueModel? selectedLeague;
  final List<ClubTable> clubs;

  const HomeState({
    required this.isLoading,
    required this.matches,
    required this.leagues,
    this.selectedLeague,
    this.clubs = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    List<MatchModel>? matches,
    List<LeagueModel>? leagues,
    LeagueModel? selectedLeague,
    List<ClubTable>? clubs,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      matches: matches ?? this.matches,
      leagues: leagues ?? this.leagues,
      selectedLeague: selectedLeague ?? this.selectedLeague,
      clubs: clubs ?? this.clubs,
    );
  }

  factory HomeState.initial() => const HomeState(
    isLoading: false,
    matches: [],
    leagues: [],
    selectedLeague: null,
    clubs: [],
  );
}
