import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/image_path.dart';
import 'package:mvc_multi_screens/src/core/utils/match_utils.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/match_card.dart';

class MatchesWidget extends StatelessWidget {
  const MatchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final aoVivo =
        matchesMock
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.live)
            .toList();
    final emBreve =
        matchesMock
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.upcoming)
            .toList();
    final finalizadas =
        matchesMock
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.finished)
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Partidas de hoje', style: titleText28),
        const SizedBox(height: 12),
        Row(
          children: [
            _leagueIcon(ImagePath.brasileirao),
            _leagueIcon(ImagePath.premier),
            _leagueIcon(ImagePath.nos),
            _leagueIcon(ImagePath.laliga),
            _leagueIcon(ImagePath.bundesliga),
          ],
        ),
        const SizedBox(height: 30),
        _sectionTitle('Partidas ao vivo'),
        ...aoVivo.map((match) => MatchCard(match: match)),
        const SizedBox(height: 18),
        _sectionTitle('Partidas em Breve'),
        ...emBreve.map((match) => MatchCard(match: match)),
        const SizedBox(height: 18),
        _sectionTitle('Partidas Finalizadas'),
        ...finalizadas.map((match) => MatchCard(match: match)),
      ],
    );
  }

  Widget _leagueIcon(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Image.asset(asset, width: 50, height: 50),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(title, style: titleText22),
    );
  }
}
