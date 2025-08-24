import 'package:get_it/get_it.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<CounterCubit>(CounterCubit());
}
