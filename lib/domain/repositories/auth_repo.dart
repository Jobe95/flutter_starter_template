import 'package:dartz/dartz.dart';
import 'package:jobe_template/core/usecases/usecases.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Failure, NoParams>> logout();
}
