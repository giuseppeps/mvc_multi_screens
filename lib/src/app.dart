import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/core/di/di.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/view/counter_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => getIt<CounterCubit>(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CounterView(),
      ),
    );
  }
}
