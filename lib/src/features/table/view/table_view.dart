import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_view_large.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_view_medium.dart';
import 'package:mvc_multi_screens/src/features/table/view/table_view_small.dart';

import '../../../core/utils/screen_size_helper.dart';

class TableView extends StatelessWidget {
  const TableView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeHelper.getScreenType(context);

    return BlocProvider(
      create: (_) => GetIt.I<CounterCubit>(),
      child: Builder(
        builder: (_) {
          switch (screenType) {
            case ScreenType.small:
              return const TableViewSmall();
            case ScreenType.medium:
              return const TableViewMedium();
            case ScreenType.large:
              return const TableViewLarge();
          }
        },
      ),
    );
  }
}
