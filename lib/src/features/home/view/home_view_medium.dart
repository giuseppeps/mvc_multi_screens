import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/matches_widget.dart';

class HomeViewMedium extends StatelessWidget {
  const HomeViewMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Medium')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: MatchesWidget()),
            const SizedBox(width: 12),
            Expanded(
              child: LeagueTable(
                clubs: clubsMock,
                type: LeagueTableType.small,
                onTapClub: (club) {
                  // Handle club tap
                  print('Tapped on club: ${club.name}');
                },
                onTapSeeAll: () {
                  Navigator.pushNamed(context, '/table');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
