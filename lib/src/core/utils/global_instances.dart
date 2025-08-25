import 'package:mvc_multi_screens/src/core/api/api_client.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/utils/app_texts.dart';

ApiClient authClient = getIt<ApiClient>(instanceName: AppTexts.authClient);
