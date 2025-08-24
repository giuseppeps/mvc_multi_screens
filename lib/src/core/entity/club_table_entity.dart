import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';

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
}
