import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';

enum ClubTileType { normal, small }

class ClubTile extends StatelessWidget {
  final Club club;
  final ClubTileType? type;

  const ClubTile({
    super.key,
    required this.club,
    this.type = ClubTileType.normal,
  });

  double get _radius => type == ClubTileType.normal ? 60 : 40;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 12,
      leading: Image.network(
        club.imageUrl ?? '',
        fit: BoxFit.contain,
        width: _radius * 2,
        height: _radius * 2,
      ),
      title: Text(club.name, style: titleText22),
      subtitle: Text(
        '${club.position}º lugar em ${club.league}',
        style: titleText16,
      ),
    );
  }
}
