import 'package:mvc_multi_screens/src/features/club_info/repository/club_info_repository.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class ClubInfoService {
  final ClubInfoRepository _repository;

  ClubInfoService(this._repository);

  Future<List<MatchModel>> getClubMatches(int clubId) async {
    return await _repository.fetchClubMatches(clubId);
  }

  Future<List<String>> getClubSquad(int clubId) async {
    return await _repository.fetchClubSquad(clubId);
  }
}
