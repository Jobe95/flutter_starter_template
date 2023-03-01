import 'package:dartz/dartz.dart';
import 'package:jobe_template/core/usecases/usecases.dart';

import '../entities/entities.dart';

abstract class FruitRepository {
  Future<Either<Failure, List<Fruit>>> getAll();
  Future<Either<Failure, Fruit>> getByName(String name);
}
