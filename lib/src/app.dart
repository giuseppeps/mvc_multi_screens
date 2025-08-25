import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/entity/club_table_entity.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/utils/screen_size_helper.dart';
import 'package:mvc_multi_screens/src/features/club_info/view/club_info_view.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/view/home_view.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor:
              screenType == ScreenType.small ? backgroundColor : Colors.white,
        ),
        routes: {
          '/': (context) => const HomeView(),
          '/table': (context) {
            final clubs =
                ModalRoute.of(context)?.settings.arguments
                    as List<ClubTable>? ??
                [];
            return TableScreen(clubs: clubs);
          },
          '/club-info': (context) => const ClubInfoView(),
        },
      ),
    );
  }
}
