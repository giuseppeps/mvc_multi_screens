import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_cubit.dart';
import 'package:mvc_multi_screens/src/features/table/controller/table_cubit.dart';
import 'package:mvc_multi_screens/src/features/table/controller/table_state.dart';

class TableScreenSmall extends StatelessWidget {
  const TableScreenSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TableCubit, TableState>(
          builder: (context, state) {
            return LeagueTable(
              clubs: state.clubsList,
              type: LeagueTableType.small,
              onTapClub: (club) {
                getIt<ClubInfoCubit>().setClubsList(state.clubsList);
                Navigator.pushNamed(context, '/club-info', arguments: club);
              },
            );
          },
        ),
      ),
    );
  }
}
