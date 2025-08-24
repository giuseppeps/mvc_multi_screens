import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';

class MatchModel {
  final Club teamHome;
  final Club teamAway;
  final String league;
  final DateTime date;
  final int? teamHomeScore;
  final int? teamAwayScore;

  MatchModel({
    required this.teamHome,
    required this.teamAway,
    required this.league,
    required this.date,
    this.teamHomeScore,
    this.teamAwayScore,
  });
}
