import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/header_cell.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/league_table.dart';

class BuildHeader extends StatelessWidget {
  final LeagueTableType type;
  const BuildHeader({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final labels =
        type == LeagueTableType.normal
            ? ['#', 'Clube', 'PD', 'V', 'E', 'D', 'GM', 'GS', 'DG', 'Pts']
            : ['#', 'Clube', 'Pts', 'V', 'D'];

    return Row(
      children: [
        // Posição
        SizedBox(width: 50, child: HeaderCell(label: labels[0])),
        // Clube (expandível)
        Expanded(flex: 3, child: HeaderCell(label: labels[1])),
        // Colunas numéricas
        if (type == LeagueTableType.normal) ...[
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[2], // PD
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[3], // V
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[4], // E
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[5], // D
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[6], // GM
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[7], // GS
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[8], // DG
            ),
          ),
          SizedBox(
            width: 50,
            child: HeaderCell(
              label: labels[9], // Pts
            ),
          ),
        ] else ...[
          SizedBox(
            width: 50,
            child: HeaderCell(
              label: labels[2], // Pts
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[3], // V
            ),
          ),
          SizedBox(
            width: 40,
            child: HeaderCell(
              label: labels[4], // D
            ),
          ),
        ],
      ],
    );
  }
}
