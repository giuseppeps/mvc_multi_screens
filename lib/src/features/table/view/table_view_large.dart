import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class TableViewLarge extends StatelessWidget {
  const TableViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Large')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LeagueTable(
              clubs: clubsMock,
              onTapClub: (club) {
                // Handle club tap
                print('Tapped on club: ${club.name}');
              },
            ),
          ),
        ),
      ),
    );
  }
}
