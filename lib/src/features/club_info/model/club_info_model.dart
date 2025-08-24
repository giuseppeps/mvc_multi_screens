import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class ClubInfoModel {
  final Club club;
  final List<MatchModel> upcomingMatches;
  final List<MatchModel> lastMatches;
  final List<ClubTable> tableMock;
  final List<String> squad;

  ClubInfoModel({
    required this.club,
    required this.upcomingMatches,
    required this.lastMatches,
    required this.tableMock,
    required this.squad,
  });
}
