import 'package:dio/dio.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';
import 'package:nomabe/core/data/constants/api/model/apimodel.dart';

class NomabeRequestMaker {
  final Dio _dio = Dio();

  Future<Response> makeGetRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    return await _dio.get('$baseUrl/$path',
        data: options?.data,
        options: Options(
          headers: <String, String>{
            'Content-Type': APICallConstant.API_HEADER,
            'Authorization': options?.authorization ?? '',
          },
        ));
  }

  Future<Response> makePostRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    return await _dio.post('$baseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': APICallConstant.API_HEADER,
          'Authorization': options?.authorization ?? '',
        }));
  }

  Future<Response> makePutRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    return await _dio.put('$baseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': APICallConstant.API_HEADER,
          'Authorization': options?.authorization ?? '',
        }));
  }

  Future<Response> makeDeleteRequest({
    String? baseUrl = APICallConstant.API_BASE_URL,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    return await _dio.delete('$baseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': APICallConstant.API_HEADER,
          'Authorization': options?.authorization ?? '',
        }));
  }
}
