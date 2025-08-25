import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/view/home_view_large.dart';
import 'package:mvc_multi_screens/src/features/home/view/home_view_medium.dart';
import 'package:mvc_multi_screens/src/features/home/view/home_view_small.dart';

import '../../../core/utils/screen_size_helper.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getIt<HomeCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return Builder(
      builder: (_) {
        switch (screenType) {
          case ScreenType.small:
            return const HomeViewSmall();
          case ScreenType.medium:
            return const HomeViewMedium();
          case ScreenType.large:
            return const HomeViewLarge();
        }
      },
    );
  }
}
