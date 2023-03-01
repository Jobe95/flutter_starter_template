import 'package:dartz/dartz.dart';
import 'package:jobe_template/core/utils/utils.dart';

import 'package:jobe_template/domain/entities/entities.dart';

import '../../../core/usecases/usecases.dart';
import '../../repositories/repositories.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    if (params.username.length < 5) {
      return Left(
        ValidationFailure(
            message: 'Username needs to be atleast 6 characters long'),
      );
    }
    if (!params.email.isValidEmail()) {
      return Left(
        ValidationFailure(message: 'Email needs to be valid'),
      );
    }
    if (params.password.length < 9) {
      return Left(
        ValidationFailure(
            message: 'Password needs to be atleast 10 characters long'),
      );
    }
    return await repository.login(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String username;
  final String email;
  final String password;
  LoginParams({
    required this.username,
    required this.email,
    required this.password,
  });
}
