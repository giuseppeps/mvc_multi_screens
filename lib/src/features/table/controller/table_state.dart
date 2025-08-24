import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';

class TableState {
  final List<ClubTable> clubsList;

  TableState(this.clubsList);

  TableState.initial() : clubsList = [];

  TableState copyWith(List<ClubTable> clubsList) {
    return TableState(clubsList);
  }
}
