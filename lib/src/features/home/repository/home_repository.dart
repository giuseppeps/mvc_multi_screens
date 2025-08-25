import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/core/utils/app_texts.dart';
import 'package:mvc_multi_screens/src/core/utils/global_instances.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class HomeRepository {
  Future<List<MatchModel>> fetchMatches() async {
    final response = await authClient.get(path: AppTexts.matches);

    return (response.data['matches'] as List)
        .map<MatchModel>((match) => MatchModel.fromJson(match))
        .toList();
  }

  Future<List<ClubTable>> fetchLeagueTable(LeagueModel league) async {
    final response = await authClient.get(
      path: AppTexts().leagueTable(league.id),
    );

    final standings = response.data['standings'] as List?;
    if (standings == null || standings.isEmpty) return [];

    final table = standings.first['table'] as List?;
    if (table == null) return [];

    return table
        .map<ClubTable>((club) => ClubTable.fromJson(club, league))
        .toList();
  }
}
