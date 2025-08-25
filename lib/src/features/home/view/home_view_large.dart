import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_state.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/matches_widget.dart';

class HomeViewLarge extends StatelessWidget {
  const HomeViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: MatchesWidget(matches: state.matches)),
                    const SizedBox(width: 12),
                    if (state.selectedLeague != null && state.clubs.isNotEmpty)
                      Expanded(
                        child: LeagueTable(
                          clubs: state.clubs,
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
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
