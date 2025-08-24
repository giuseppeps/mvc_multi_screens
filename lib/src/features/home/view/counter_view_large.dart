import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class CounterViewLarge extends StatelessWidget {
  const CounterViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Large')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: LeagueTable(
                clubs: clubsMock,
                type: LeagueTableType.normal,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: LeagueTable(clubs: clubsMock, type: LeagueTableType.small),
            ),
          ],
        ),
      ),
    );
  }
}
