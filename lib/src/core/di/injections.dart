import 'package:get_it/get_it.dart';
import 'package:mvc_multi_screens/src/core/api/api_client.dart';
import 'package:mvc_multi_screens/src/core/api/api_response_service.dart';
import 'package:mvc_multi_screens/src/core/utils/app_texts.dart';
import 'package:mvc_multi_screens/src/features/club_info/controller/club_info_cubit.dart';
import 'package:mvc_multi_screens/src/features/club_info/repository/club_info_repository.dart';
import 'package:mvc_multi_screens/src/features/club_info/service/club_info_service.dart';
import 'package:mvc_multi_screens/src/features/home/controller/home_cubit.dart';
import 'package:mvc_multi_screens/src/features/home/repository/home_repository.dart';
import 'package:mvc_multi_screens/src/features/home/service/home_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiClient>(
    ApiClient(isAuth: true),
    instanceName: AppTexts.authClient,
  );
  // Repositories
  getIt.registerFactory(() => HomeRepository());
  getIt.registerFactory(() => ClubInfoRepository());
  // Services
  getIt.registerSingleton(ApiResponseService());
  getIt.registerFactory(() => HomeService(getIt()));
  getIt.registerFactory(() => ClubInfoService(getIt()));
  // Cubits
  getIt.registerSingleton(HomeCubit(getIt()));
  getIt.registerSingleton(ClubInfoCubit(getIt()));
}
