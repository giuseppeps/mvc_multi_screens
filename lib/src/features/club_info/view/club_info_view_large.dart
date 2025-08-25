import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/widgets/club_tile.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/features/club_info/model/club_info_model.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/club_info_table.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/live_match_widget.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/next_last_matches_widget.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/squad_widget.dart';

class ClubInfoViewLarge extends StatelessWidget {
  final ClubInfoModel model;

  const ClubInfoViewLarge({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Club Header
                ClubTile(club: model.club),
                const SizedBox(height: 32),
                // Live Match
                LiveMatchWidget(lastMatches: model.matches),
                const SizedBox(height: 32),
                // Next and Last Matches + Table
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Next Matches
                    Expanded(
                      flex: 1,
                      child: NextLastMatchesWidget(matches: model.matches),
                    ),
                    const SizedBox(width: 32),
                    // Table
                    Expanded(
                      flex: 1,
                      child: ClubInfoTable(clubs: model.clubTable),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SquadWidget(squad: model.squad, type: SquadWidgetType.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
