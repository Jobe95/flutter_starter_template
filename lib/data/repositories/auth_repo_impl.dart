import 'package:jobe_template/core/network/network_connectivity.dart';
import 'package:jobe_template/data/models/user_model.dart';
import 'package:jobe_template/domain/entities/user.dart';
import 'package:jobe_template/core/usecases/usecase.dart';
import 'package:jobe_template/core/usecases/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:jobe_template/domain/repositories/repositories.dart';

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
