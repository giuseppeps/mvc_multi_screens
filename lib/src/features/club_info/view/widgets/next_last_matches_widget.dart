import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/match_utils.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/match_card.dart';

class NextLastMatchesWidget extends StatelessWidget {
  final List<MatchModel> matches;

  const NextLastMatchesWidget({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    final finishedMatches =
        matches
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.finished)
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
    final nextMatches =
        matches
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.upcoming)
            .toList()
          ..sort((a, b) => a.date.compareTo(b.date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Próximas partidas', style: titleText22),
        const SizedBox(height: 12),
        ...nextMatches.take(3).map((m) => MatchCard(match: m)),
        const SizedBox(height: 24),
        const Text('Últimas partidas', style: titleText22),
        const SizedBox(height: 12),
        ...finishedMatches.take(3).map((m) => MatchCard(match: m)),
      ],
    );
  }
}
