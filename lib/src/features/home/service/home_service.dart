import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/home/model/league_model.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';
import 'package:mvc_multi_screens/src/features/home/repository/home_repository.dart';

class HomeService {
  final HomeRepository _repository;

  HomeService(this._repository);

  Future<List<MatchModel>> getMatches() async {
    return await _repository.fetchMatches();
  }

  Future<List<ClubTable>> getLeagueTable(LeagueModel league) async {
    return await _repository.fetchLeagueTable(league);
  }
}
