import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/widgets/club_tile.dart';
import 'package:mvc_multi_screens/src/core/widgets/custom_app_bar.dart';
import 'package:mvc_multi_screens/src/features/club_info/model/club_info_model.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/club_info_table.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/live_match_widget.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/next_last_matches_widget.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/widgets/squad_widget.dart';

class ClubInfoViewSmall extends StatelessWidget {
  final ClubInfoModel model;

  const ClubInfoViewSmall({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Club Header
            ClubTile(club: model.club, type: ClubTileType.small),
            const SizedBox(height: 32),
            // Live Match
            LiveMatchWidget(
              lastMatches: model.lastMatches,
              type: LiveMatchWidgetType.small,
            ),
            const SizedBox(height: 32),
            // Next and Last Matches + Table
            NextLastMatchesWidget(
              upcomingMatches: model.upcomingMatches,
              lastMatches: model.lastMatches,
            ),
            const SizedBox(height: 32),
            // Table
            ClubInfoTable(clubs: model.tableMock),
            const SizedBox(height: 32),
            SquadWidget(squad: model.squad, type: SquadWidgetType.small),
          ],
        ),
      ),
    );
  }
}
