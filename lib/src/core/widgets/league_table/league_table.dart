import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/build_header.dart';
import 'package:mvc_multi_screens/src/core/widgets/league_table/build_row.dart';

enum LeagueTableType { normal, small }

class LeagueTable extends StatelessWidget {
  final List<ClubTable> clubs;
  final LeagueTableType? type;
  final Function(ClubTable)? onTapClub;
  final Function()? onTapSeeAll;

  const LeagueTable({
    super.key,
    required this.clubs,
    this.type = LeagueTableType.normal,
    this.onTapClub,
    this.onTapSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTapSeeAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classificação ${clubs.first.league ?? ''}',
                maxLines: type == LeagueTableType.small ? 2 : 1,
                overflow:
                    type == LeagueTableType.small
                        ? TextOverflow.ellipsis
                        : null,
                style: titleText32,
              ),
              const SizedBox(height: 12),
              Text(
                'Rodada ${clubs.first.matches} de ${clubs.first.matches}',
                style: titleText14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: tableBorderColor, width: 1),
            borderRadius: BorderRadius.circular(8),
            color: whiteColor,
          ),
          child: Column(
            children: [
              BuildHeader(type: type!),
              ...clubs
                  .map(
                    (club) => InkWell(
                      onTap: onTapClub == null ? null : () => onTapClub!(club),
                      child: BuildRow(type: type!, club: club),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
