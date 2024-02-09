import 'package:dio/dio.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';

class NomabeRequestMaker {
  final Dio _dio = Dio();

  Future<Response> makeGetRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.get(
      '$baseUrl/$path',
      data: data,
    );
  }

  Future<Response> makePostRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.post('$baseUrl/$path',
        data: data,
        options: Options(headers: <String, String>{
          "Content-Type": APICallConstant.API_HEADER,
        }));
  }

  Future<Response> makePutRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    Object? data,
  }) async {
    return await _dio.put('$baseUrl/$path',
        data: data,
        options: Options(headers: <String, String>{
          "Content-Type": APICallConstant.API_HEADER,
        }));
  }

  Future<Response> makeDeleteRequest({
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
