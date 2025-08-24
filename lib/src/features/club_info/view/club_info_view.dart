import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/mocks/mocks.dart';
import 'package:mvc_multi_screens/src/core/utils/image_path.dart';
import 'package:mvc_multi_screens/src/core/utils/screen_size_helper.dart';
import 'package:mvc_multi_screens/src/features/club_info/model/club_info_model.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_large.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_medium.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_small.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';

class ClubInfoView extends StatelessWidget {
  const ClubInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocProvider(
      create: (_) => GetIt.I<CounterCubit>(),
      child: Builder(
        builder: (_) {
          final model = ClubInfoModel(
            club: Club(
              id: '4',
              name: 'Real Madrid',
              imageUrl: ImagePath.laliga,
              league: 'La Liga',
            ),
            upcomingMatches:
                matchesMock
                    .where(
                      (m) =>
                          m.teamHome.name == 'Real Madrid' ||
                          m.teamAway.name == 'Real Madrid',
                    )
                    .take(3)
                    .toList(),
            lastMatches: matchesMock.take(3).toList(),
            tableMock: clubsMock.take(5).toList(),
            squad: const [
              'Toni Kroos',
              'Aurélien Tchouaméni',
              'Luke Modric',
              'Federico Valverde',
              'Karim Benzema',
              'Thibaut Courtois',
              'Daniel Carvajal',
              'Éder Militão',
              'David Alaba',
              'Ferland Mendy',
              'Vinícius Junior',
            ],
          );

          switch (screenType) {
            case ScreenType.small:
              return ClubInfoViewSmall(model: model);
            case ScreenType.medium:
              return ClubInfoViewMedium(model: model);
            case ScreenType.large:
              return ClubInfoViewLarge(model: model);
          }
        },
      ),
    );
  }
}
