import 'package:dartz/dartz.dart';
import 'package:jobe_template/core/usecases/usecases.dart';
import 'package:jobe_template/features/fruits/domain/entities/entities.dart';
import 'package:jobe_template/features/fruits/domain/repositories/fruit_repository.dart';

class GetAllFruitsUseCase implements UseCase<List<Fruit>, NoParams> {
  final FruitRepository repository;

  GetAllFruitsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Fruit>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
