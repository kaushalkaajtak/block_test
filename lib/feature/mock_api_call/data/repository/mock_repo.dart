import 'dart:developer';

import 'package:block_test/feature/mock_api_call/data/models/mock_data_model.dart';
import 'package:dio/dio.dart';

const _post = '/posts';

class MockRepo {
  late Dio _dio;

  MockRepo({required Dio dio}) : _dio = dio;

  Future<List<DataModel>> getData() async {
    List<DataModel> models = [];
    try {
      var response = await _dio.get(_post);

      if (response.data != null) {
        var dataModelList = response.data as List<dynamic>;

        for (var element in dataModelList) {
          models.add(DataModel.fromJson(element));
        }
      }
      return models;
    } catch (e) {
      log('error $e');
      throw Exception('Some weird error');
    }
  }
}
