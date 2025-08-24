import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class TableViewSmall extends StatelessWidget {
  const TableViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LeagueTable(
          clubs: clubsMock,
          type: LeagueTableType.small,
          onTapClub: (club) {
            // Handle club tap
            Navigator.pushNamed(context, '/club-info', arguments: club);
          },
        ),
      ),
    );
  }
}
