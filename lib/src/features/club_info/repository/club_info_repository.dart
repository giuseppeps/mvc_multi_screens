import 'package:mvc_multi_screens/src/core/utils/global_instances.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class ClubInfoRepository {
  Future<List<MatchModel>> fetchClubMatches(int clubId) async {
    final response = await authClient.get(path: 'teams/$clubId/matches');
    final matches = response.data['matches'] as List?;
    if (matches == null) return [];
    return matches
        .map<MatchModel>((match) => MatchModel.fromJson(match))
        .toList();
  }

  Future<List<String>> fetchClubSquad(int clubId) async {
    final response = await authClient.get(path: 'teams/$clubId');
    final squad = response.data['squad'] as List?;
    if (squad == null) return [];
    return squad.map<String>((player) => player['name'] as String).toList();
  }
}
