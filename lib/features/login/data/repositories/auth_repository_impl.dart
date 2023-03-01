import 'package:jobe_template/core/network/network_connectivity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../models/models.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.networkConnectivity});

  final NetworkConnectivity networkConnectivity;
  @override
  Future<Either<Failure, User>> login({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(
      UserModel.fromJson({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
  }

  @override
  Future<Either<Failure, NoParams>> logout() async {
    return Left(CacheFailure(message: 'No network'));
  }
}
