import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/image_path.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type == LiveMatchWidgetType.small
              ? 'Partida ao vivo\n'
                  '${lastMatches[0].teamHome.name} vs. ${lastMatches[0].teamAway.name}'
              : 'Partida ao vivo: ${lastMatches[0].teamHome.name} vs. ${lastMatches[0].teamAway.name}',
          style: titleText28,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset(
              ImagePath.laliga,
              width: type == LiveMatchWidgetType.small ? 100 : 200,
              height: type == LiveMatchWidgetType.small ? 100 : 200,
              fit: BoxFit.contain,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(
              '${lastMatches[0].teamHomeScore}x${lastMatches[0].teamAwayScore}',
              style: titleText32.copyWith(
                fontSize: type == LiveMatchWidgetType.small ? 56 : 100,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Image.asset(
              ImagePath.laliga,
              width: type == LiveMatchWidgetType.small ? 100 : 200,
              height: type == LiveMatchWidgetType.small ? 100 : 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (type == LiveMatchWidgetType.medium)
          Text(
            '${lastMatches[0].teamHome.name} vs. ${lastMatches[0].teamAway.name}',
            style: titleText18,
          ),
        Text(
          '${lastMatches[0].league} ${lastMatches[0].stadium != null ? '| ${lastMatches[0].stadium}' : ''}'
          '| ${MatchUtils.formatHour(lastMatches[0].date)}',
          style: titleText14,
        ),
        if (MatchUtils.getStatus(lastMatches[0]) == MatchStatus.live)
          const Text(
            'Live',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
