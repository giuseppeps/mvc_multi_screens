import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
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
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: MatchesWidget()),
                const SizedBox(width: 12),
                Expanded(
                  child: LeagueTable(
                    clubs: clubsMock,
                    onTapClub: (club) {
                      // Handle club tap
                      Navigator.pushNamed(
                        context,
                        '/club-info',
                        arguments: club,
                      );
                    },
                    onTapSeeAll: () {
                      Navigator.pushNamed(context, '/table');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
