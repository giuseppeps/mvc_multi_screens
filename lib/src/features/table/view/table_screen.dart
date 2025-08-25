import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_screen_large.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_screen_medium.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_screen_small.dart';

import '../../../core/utils/screen_size_helper.dart';
import '../controller/table_cubit.dart';

class TableScreen extends StatelessWidget {
  final List<ClubTable> clubs;
  const TableScreen({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocProvider(
      create: (_) => TableCubit()..setClubsList(clubs),
      child: Builder(
        builder: (_) {
          switch (screenType) {
            case ScreenType.small:
              return const TableScreenSmall();
            case ScreenType.medium:
              return const TableScreenMedium();
            case ScreenType.large:
              return const TableScreenLarge();
          }
        },
      ),
    );
  }
}
