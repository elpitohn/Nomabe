import 'package:dio/dio.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';
import 'package:nomabe/core/data/constants/api/apiconstantsexample.dart';
import 'package:nomabe/core/data/constants/api/model/apimodel.dart';

class NomabeRequestMaker {
  final Dio _dio = Dio();

  Future<Response> makeGetRequest({
    String? baseUrl,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    String requestBaseUrl = baseUrl ?? await APICallConstant().API_BASE_URL();
    String requestApiHeader = await APICallConstant().API_HEADER() ?? '';

    return await _dio.get('$requestBaseUrl/$path',
        data: options?.data,
        options: Options(
          headers: <String, String>{
            'Content-Type': requestApiHeader,
            'Authorization': options?.authorization ?? '',
          },
        ));
  }

  Future<Response> makePostRequest({
    String? baseUrl,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    String requestBaseUrl = baseUrl ?? await APICallConstant().API_BASE_URL();
    String requestApiHeader = await APICallConstant().API_HEADER() ?? '';

    return await _dio.post('$requestBaseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': requestApiHeader,
          'Authorization': options?.authorization ?? '',
        }));
  }

  Future<Response> makePutRequest({
    String? baseUrl,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    String requestBaseUrl = baseUrl ?? await APICallConstant().API_BASE_URL();
    String requestApiHeader = await APICallConstant().API_HEADER() ?? '';

    return await _dio.put('$requestBaseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': requestApiHeader,
          'Authorization': options?.authorization ?? '',
        }));
  }

  Future<Response> makeDeleteRequest({
    String? baseUrl,
    String? path = '',
    ApiRequestModel? options,
  }) async {
    String requestBaseUrl = baseUrl ?? await APICallConstant().API_BASE_URL();
    String requestApiHeader = await APICallConstant().API_HEADER() ?? '';
    
    return await _dio.delete('$requestBaseUrl/$path',
        data: options?.data,
        options: Options(headers: <String, String>{
          'Content-Type': requestApiHeader,
          'Authorization': options?.authorization ?? '',
        }));
  }
}
