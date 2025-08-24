import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<CounterCubit>().increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
