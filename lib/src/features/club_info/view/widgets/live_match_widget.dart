import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/match_utils.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

enum LiveMatchWidgetType { small, medium }

class LiveMatchWidget extends StatelessWidget {
  final List<MatchModel> lastMatches;
  final LiveMatchWidgetType type;

  const LiveMatchWidget({
    super.key,
    required this.lastMatches,
    this.type = LiveMatchWidgetType.medium,
  });

  @override
  Widget build(BuildContext context) {
    MatchModel? matchToShow;
    if (lastMatches.isNotEmpty) {
      matchToShow = lastMatches.firstWhere(
        (m) => MatchUtils.getStatus(m) == MatchStatus.live,
        orElse:
            () => lastMatches.firstWhere(
              (m) => MatchUtils.getStatus(m) == MatchStatus.upcoming,
              orElse: () => lastMatches.first,
            ),
      );
    }
    if (matchToShow == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type == LiveMatchWidgetType.small
              ? 'Partida ao vivo\n${matchToShow.teamHome.name} vs. ${matchToShow.teamAway.name}'
              : 'Partida ao vivo: ${matchToShow.teamHome.name} vs. ${matchToShow.teamAway.name}',
          style: titleText28,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.network(
              matchToShow.teamHome.imageUrl ?? '',
              width: type == LiveMatchWidgetType.small ? 100 : 200,
              height: type == LiveMatchWidgetType.small ? 100 : 200,
              fit: BoxFit.contain,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(
              '${matchToShow.teamHomeScore}x${matchToShow.teamAwayScore}',
              style: titleText32.copyWith(
                fontSize: type == LiveMatchWidgetType.small ? 56 : 100,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Image.network(
              matchToShow.teamAway.imageUrl ?? '',
              width: type == LiveMatchWidgetType.small ? 100 : 200,
              height: type == LiveMatchWidgetType.small ? 100 : 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (type == LiveMatchWidgetType.medium)
          Text(
            '${matchToShow.teamHome.name} vs. ${matchToShow.teamAway.name}',
            style: titleText18,
          ),
        Text(
          '${matchToShow.league.name} ${matchToShow.stadium != null ? '| ${matchToShow.stadium}' : ''}'
          '| ${MatchUtils.formatHour(matchToShow.date)}',
          style: titleText14,
        ),
        if (MatchUtils.getStatus(matchToShow) == MatchStatus.live)
          const Text(
            'Live',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
