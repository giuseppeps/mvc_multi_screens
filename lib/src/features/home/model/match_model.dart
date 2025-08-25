import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';

class MatchModel {
  final Club teamHome;
  final Club teamAway;
  final LeagueModel league;
  final String? stadium;
  final DateTime date;
  final int? teamHomeScore;
  final int? teamAwayScore;

  MatchModel({
    required this.teamHome,
    required this.teamAway,
    required this.league,
    this.stadium,
    required this.date,
    this.teamHomeScore,
    this.teamAwayScore,
  });

  static MatchModel fromJson(Map<String, dynamic> json) {
    final homeTeam = json['homeTeam'];
    final awayTeam = json['awayTeam'];
    final competition = json['competition'];
    final score = json['score'];

    return MatchModel(
      teamHome: Club(
        id: homeTeam['id'],
        name: homeTeam['shortName'],
        imageUrl: homeTeam['crest'],
      ),
      teamAway: Club(
        id: awayTeam['id'],
        name: awayTeam['shortName'],
        imageUrl: awayTeam['crest'],
      ),
      league: LeagueModel.fromJson(competition),
      stadium: null,
      date: DateTime.parse(json['utcDate']),
      teamHomeScore: score['fullTime']['home'],
      teamAwayScore: score['fullTime']['away'],
    );
  }
}
