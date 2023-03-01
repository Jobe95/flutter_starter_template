import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:jobe_template/core/network/network_connectivity.dart';
import 'package:jobe_template/features/fruits/data/datasources/fruit_remote_data_source.dart';
import 'package:jobe_template/features/fruits/data/repositories/fruit_repository_impl.dart';
import 'package:jobe_template/features/fruits/domain/repositories/fruit_repository.dart';

import 'features/fruits/domain/usecases/usecases.dart';
import 'features/fruits/presentation/bloc/fruit_detail_bloc.dart';
import 'features/fruits/presentation/bloc/fruits_bloc.dart';
import 'features/login/data/repositories/auth_repository_impl.dart';
import 'features/login/domain/repositories/repositories.dart';
import 'features/login/domain/usecases/usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => FruitsBloc(
        getAllFruitsUseCase: sl(),
      ));
  sl.registerFactory(() => FruitDetailBloc(
        getFruitByNameUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetAllFruitsUseCase(sl()));
  sl.registerLazySingleton(() => GetFruitByNameUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(networkConnectivity: sl()),
  );
  sl.registerLazySingleton<FruitRepository>(() =>
      FruitRepositoryImpl(networkConnectivity: sl(), remoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<FruitRemoteDataSource>(
      () => FruitRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkConnectivity>(
    () => NetworkConnectivityImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());
}
