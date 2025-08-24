import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/table/controller/table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(TableState.initial());

  void setClubsList(List<ClubTable> clubs) {
    emit(state.copyWith(clubs));
  }
}
