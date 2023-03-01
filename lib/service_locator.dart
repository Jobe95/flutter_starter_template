import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:jobe_template/core/network/network_connectivity.dart';
import 'package:jobe_template/data/repositories/auth_repo_impl.dart';
import 'package:jobe_template/domain/repositories/repositories.dart';
import 'package:jobe_template/domain/usecases/usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkConnectivity: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkConnectivity>(
    () => NetworkConnectivityImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => Connectivity());
}
