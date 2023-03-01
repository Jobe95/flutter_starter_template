import 'package:jobe_template/core/usecases/usecases.dart';
import 'package:jobe_template/features/fruits/data/datasources/fruit_remote_data_source.dart';
import 'package:jobe_template/features/fruits/domain/entities/fruit.dart';
import 'package:dartz/dartz.dart';
import 'package:jobe_template/features/fruits/domain/repositories/fruit_repository.dart';

import '../../../../core/network/network_connectivity.dart';

class FruitRepositoryImpl implements FruitRepository {
  FruitRepositoryImpl({
    required this.networkConnectivity,
    required this.remoteDataSource,
  });

  final NetworkConnectivity networkConnectivity;
  final FruitRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Fruit>>> getAll() async {
    if (await networkConnectivity.isConnected) {
      try {
        final remoteData = await remoteDataSource.getAllFruits();
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: 'Error fetching fruits on server'));
      }
    } else {
      return Left(CacheFailure(message: 'Error fetching fruits on local'));
    }
  }

  @override
  Future<Either<Failure, Fruit>> getByName(String name) async {
    if (await networkConnectivity.isConnected) {
      try {
        final remoteData = await remoteDataSource.getByName(name);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: 'Error fetching fruit on server'));
      }
    } else {
      return Left(CacheFailure(message: 'Error fetching fruit on local'));
    }
  }
}
