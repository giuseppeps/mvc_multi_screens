import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';

class ClubTable extends Club {
  final int points;
  final int matches;
  final int wins;
  final int draws;
  final int losses;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  ClubTable({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.position,
    required super.league,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.points,
    required this.matches,
    required this.wins,
    required this.draws,
    required this.losses,
  });

  factory ClubTable.fromJson(Map<String, dynamic> json, LeagueModel league) {
    return ClubTable(
      id: json['team']['id'],
      name: json['team']['shortName'],
      imageUrl: json['team']['crest'],
      position: json['position'],
      league: league.name,
      goalsFor: json['goalsFor'],
      goalsAgainst: json['goalsAgainst'],
      goalDifference: json['goalDifference'],
      points: json['points'],
      matches: json['playedGames'],
      wins: json['won'],
      draws: json['draw'],
      losses: json['lost'],
    );
  }
}
