import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_state.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/matches_widget.dart';

class HomeViewSmall extends StatelessWidget {
  const HomeViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                MatchesWidget(matches: state.matches),
                const SizedBox(height: 40),
                if (state.selectedLeague != null && state.clubs.isNotEmpty)
                  LeagueTable(
                    clubs: state.clubs,
                    type: LeagueTableType.small,
                    onTapClub: (club) {
                      getIt<ClubInfoCubit>().setClubsList(state.clubs);
                      Navigator.pushNamed(
                        context,
                        '/club-info',
                        arguments: club,
                      );
                    },
                    onTapSeeAll: () {
                      Navigator.pushNamed(
                        context,
                        '/table',
                        arguments: state.clubs,
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
