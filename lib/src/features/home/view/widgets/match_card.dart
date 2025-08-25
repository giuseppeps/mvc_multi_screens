import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/match_utils.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.network(match.teamHome.imageUrl ?? '', width: 56, height: 56),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${match.teamHome.name}  vs. ${match.teamAway.name}',
                style: titleText16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: darkColor,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              Text(_getMatchInfo(match), style: titleText14),
            ],
          ),
        ],
      ),
    );
  }

  String _getMatchInfo(MatchModel match) {
    final status = MatchUtils.getStatus(match);

    switch (status) {
      case MatchStatus.live:
        return '${match.league.name} | Ao vivo';
      case MatchStatus.finished:
        return '${match.league.name} | Resultado Final: ${match.teamHomeScore ?? 0} - ${match.teamAwayScore ?? 0}';
      case MatchStatus.upcoming:
        return '${match.league.name} | ${MatchUtils.formatHour(match.date)}';
    }
  }
}
