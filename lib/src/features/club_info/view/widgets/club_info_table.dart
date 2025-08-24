import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class ClubInfoTable extends StatelessWidget {
  final List<ClubTable> clubs;

  const ClubInfoTable({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Classificação', style: titleText22),
        const SizedBox(height: 12),
        LeagueTable(
          clubs: clubs,
          type: LeagueTableType.small,
          showHeader: false,
        ),
      ],
    );
  }
}
