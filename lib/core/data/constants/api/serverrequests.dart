import 'package:dio/dio.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';

class NomabeRequestMaker {
  NomabeRequestMaker._();

  final Dio _dio = Dio();

  Future<Response> makeGetRequest<T>({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.get(
      '$baseUrl/$path',
      data: data,
    );
  }

  Future<Response> makePostRequest<T>({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.post(
      '$baseUrl/$path',
      data: data,
    );
  }

  Future<Response> makePutRequest<T>({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.put(
      '$baseUrl/$path',
      data: data,
    );
  }

  Future<Response> makeDeleteRequest<T>({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.delete(
      '$baseUrl/$path',
      data: data,
    );
  }
}
