import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class ClubInfoModel {
  final Club club;
  final List<MatchModel> matches;
  final List<ClubTable> clubTable;
  final List<String> squad;

  ClubInfoModel({
    required this.club,
    required this.matches,
    required this.clubTable,
    required this.squad,
  });

  factory ClubInfoModel.empty() {
    return ClubInfoModel(
      club: Club.empty(),
      matches: [],
      clubTable: [],
      squad: [],
    );
  }

  ClubInfoModel copyWith({
    Club? club,
    List<MatchModel>? matches,
    List<ClubTable>? clubTable,
    List<String>? squad,
  }) {
    return ClubInfoModel(
      club: club ?? this.club,
      matches: matches ?? this.matches,
      clubTable: clubTable ?? this.clubTable,
      squad: squad ?? this.squad,
    );
  }
}
