import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';
import 'package:mvc_multi_screens/src/core/utils/match_utils.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/match_card.dart';

class MatchesWidget extends StatefulWidget {
  final List<MatchModel> matches;

  const MatchesWidget({super.key, required this.matches});

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    final selectedLeague = homeCubit.state.selectedLeague;

    final filteredMatches =
        selectedLeague == null
            ? widget.matches
            : widget.matches
                .where((m) => m.league.id == selectedLeague.id)
                .toList();

    final aoVivo =
        filteredMatches
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.live)
            .toList();
    final emBreve =
        filteredMatches
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.upcoming)
            .toList();
    final finalizadas =
        filteredMatches
            .where((m) => MatchUtils.getStatus(m) == MatchStatus.finished)
            .toList();
    final uniqueLeagues =
        {
          for (var match in widget.matches) match.league.id: match.league,
        }.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Partidas de hoje', style: titleText28),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                uniqueLeagues
                    .map(
                      (league) => GestureDetector(
                        onTap: () {
                          final cubit = context.read<HomeCubit>();
                          if (selectedLeague?.id == league.id) {
                            cubit.clearLeague();
                          } else {
                            cubit.selectLeague(league);
                          }
                          setState(() {});
                        },
                        child: _leagueIcon(
                          league.imageUrl,
                          isSelected: selectedLeague?.id == league.id,
                        ),
                      ),
                    )
                    .toList(),
          ),
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

  Widget _leagueIcon(String asset, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            width: 3,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.network(asset, width: 50, height: 50),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(title, style: titleText22),
    );
  }
}
