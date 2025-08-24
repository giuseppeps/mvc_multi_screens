import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/di.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/utils/screen_size_helper.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/view/home_view.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocProvider<CounterCubit>(
      create: (context) => getIt<CounterCubit>(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor:
              screenType == ScreenType.small ? backgroundColor : Colors.white,
        ),
        routes: {
          '/': (context) => const HomeView(),
          '/table': (context) => const TableView(),
          '/club-info': (context) => const ClubInfoView(),
        },
      ),
    );
  }
}
