abstract class Failure {
  String message;
  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class ValidationFailure extends Failure {
  final int? code;
  ValidationFailure({required super.message, this.code});
}
