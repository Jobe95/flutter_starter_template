import 'package:dartz/dartz.dart';
import 'package:jobe_template/core/usecases/usecases.dart';
import 'package:jobe_template/features/fruits/domain/entities/entities.dart';
import 'package:jobe_template/features/fruits/domain/repositories/fruit_repository.dart';

class GetFruitByNameUseCase implements UseCase<Fruit, FruitByNameParam> {
  final FruitRepository repository;

  GetFruitByNameUseCase(this.repository);

  @override
  Future<Either<Failure, Fruit>> call(FruitByNameParam params) async {
    if (params.name.isEmpty) {
      return Left(ValidationFailure(message: 'Namn kan inte vara tomt'));
    }
    return await repository.getByName(params.name);
  }
}

class FruitByNameParam {
  final String name;
  FruitByNameParam(this.name);
}
