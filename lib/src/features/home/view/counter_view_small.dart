import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class CounterViewSmall extends StatelessWidget {
  const CounterViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Small')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LeagueTable(clubs: clubsMock, type: LeagueTableType.small),
      ),
    );
  }
}
