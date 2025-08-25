import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_state.dart';
import 'package:mvc_multi_screens/src/features/club_info/service/club_info_service.dart';

class ClubInfoCubit extends Cubit<ClubInfoState> {
  final ClubInfoService _service;

  ClubInfoCubit(this._service) : super(ClubInfoState.initial());

  void setClubsList(List<ClubTable> clubs) {
    emit(state.copyWith(clubInfo: state.clubInfo.copyWith(clubTable: clubs)));
  }

  void fetchData(Club? club) async {
    emit(state.copyWith(isLoading: true));
    final clubInfo = club ?? state.clubInfo.club;
    final matches = await _service.getClubMatches(clubInfo.id);
    final squad = await _service.getClubSquad(clubInfo.id);
    // Aqui você pode buscar a tabela do clube se necessário
    // final clubTable = await ...
    emit(
      state.copyWith(
        isLoading: false,
        clubInfo: state.clubInfo.copyWith(
          club: clubInfo,
          matches: matches,
          squad: squad,
          // clubTable: clubTable, // caso implemente busca da tabela
        ),
      ),
    );
  }
}
