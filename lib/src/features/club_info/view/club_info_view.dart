import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/entity/club_entity.dart';
import 'package:mvc_multi_screens/src/core/utils/screen_size_helper.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_cubit.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_state.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_large.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_medium.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view_small.dart';

class ClubInfoView extends StatefulWidget {
  const ClubInfoView({super.key});

  @override
  State<ClubInfoView> createState() => _ClubInfoViewState();
}

class _ClubInfoViewState extends State<ClubInfoView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final club = ModalRoute.of(context)?.settings.arguments as Club?;
      getIt<ClubInfoCubit>().fetchData(club);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocBuilder<ClubInfoCubit, ClubInfoState>(
      bloc: getIt<ClubInfoCubit>(),
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final model = state.clubInfo;
        switch (screenType) {
          case ScreenType.small:
            return ClubInfoViewSmall(model: model);
          case ScreenType.medium:
            return ClubInfoViewMedium(model: model);
          case ScreenType.large:
            return ClubInfoViewLarge(model: model);
        }
      },
    );
  }
}
