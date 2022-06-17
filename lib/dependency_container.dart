import 'package:cw_blochistan/features/authentication/presentation/auth_provider/authentication_Provider.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_provider/dashboard_provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';
import 'core/utils/providers/date_time_provider.dart';
import 'features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/domain/usecases/auth_usecase.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImp(dio: sl()));

  /// Configs

  /// Data Sources
  // sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImp(dio: sl()));

  /// Repository

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider());
  sl.registerLazySingleton<DashboardProvider>(() => DashboardProvider());
  sl.registerLazySingleton(() => DateTimeProvider());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// View Models

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
