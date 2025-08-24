import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/view/widgets/counter_button.dart';

class CounterViewMedium extends StatelessWidget {
  const CounterViewMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Medium')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder:
              (_, state) =>
                  Text('Count: $state', style: const TextStyle(fontSize: 32)),
        ),
      ),
      floatingActionButton: const CounterButton(),
    );
  }
}
