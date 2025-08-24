import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/match_card.dart';

class NextLastMatchesWidget extends StatelessWidget {
  final List<MatchModel> upcomingMatches;
  final List<MatchModel> lastMatches;

  const NextLastMatchesWidget({
    super.key,
    required this.upcomingMatches,
    required this.lastMatches,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Próximas partidas', style: titleText22),
        const SizedBox(height: 12),
        ...upcomingMatches.map((m) => MatchCard(match: m)),
        const SizedBox(height: 24),
        const Text('Últimas partidas', style: titleText22),
        const SizedBox(height: 12),
        ...lastMatches.map((m) => MatchCard(match: m)),
      ],
    );
  }
}
