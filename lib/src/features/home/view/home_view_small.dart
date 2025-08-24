import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/matches_widget.dart';

class HomeViewSmall extends StatelessWidget {
  const HomeViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const MatchesWidget(),
            const SizedBox(height: 40),
            LeagueTable(
              clubs: clubsMock,
              type: LeagueTableType.small,
              onTapClub: (club) {
                // Handle club tap
                Navigator.pushNamed(context, '/club-info', arguments: club);
              },
              onTapSeeAll: () {
                Navigator.pushNamed(context, '/table');
              },
            ),
          ],
        ),
      ),
    );
  }
}
