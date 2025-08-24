import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/body_cell.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class BuildRow extends StatelessWidget {
  final ClubTable club;
  final LeagueTableType type;

  const BuildRow({super.key, required this.club, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Posição
        SizedBox(
          width: 50,
          child: BodyCell(
            textAlign: TextAlign.center,
            child: Text(club.position.toString(), style: titleText14),
          ),
        ),
        // Clube (expandível)
        Expanded(
          flex: 3,
          child: BodyCell(
            textAlign: TextAlign.start,
            child: Text(
              club.name,
              style: titleText14.copyWith(
                color: darkColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // Colunas numéricas
        if (type == LeagueTableType.normal) ...[
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.matches.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.wins.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.draws.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.losses.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.goalsFor.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.goalsAgainst.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.goalDifference.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 50,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.points.toString(), style: titleText14),
            ),
          ),
        ] else ...[
          SizedBox(
            width: 50,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.points.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.wins.toString(), style: titleText14),
            ),
          ),
          SizedBox(
            width: 40,
            child: BodyCell(
              textAlign: TextAlign.center,
              child: Text(club.losses.toString(), style: titleText14),
            ),
          ),
        ],
      ],
    );
  }
}
