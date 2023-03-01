import 'dart:convert';

import 'package:jobe_template/core/usecases/usecases.dart';
import 'package:jobe_template/features/fruits/data/models/models.dart';
import 'package:http/http.dart' as http;

abstract class FruitRemoteDataSource {
  Future<List<FruitModel>> getAllFruits();
  Future<FruitModel> getByName(String name);
}

class FruitRemoteDataSourceImpl implements FruitRemoteDataSource {
  final http.Client client;
  final baseUrl = 'https://fruityvice.com/api';

  FruitRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FruitModel>> getAllFruits() async {
    final response =
        await client.get(Uri.parse('$baseUrl/fruit/all'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;

      return jsonList.map((json) => FruitModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FruitModel> getByName(String name) async {
    final response =
        await client.get(Uri.parse('$baseUrl/fruit/$name'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return FruitModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
