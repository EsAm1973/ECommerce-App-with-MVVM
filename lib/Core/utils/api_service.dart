import 'package:dio/dio.dart';
import 'package:ecommerce_app/constants.dart';

class ApiService {
  final Dio dio;

  ApiService({Dio? dio})
      : dio = dio ??
            Dio(BaseOptions(
              baseUrl: baseUrl,
              headers: {'Content-Type': 'application/json'},
            ));

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? headers}) async {
    final response =
        await dio.get(endPoint, options: Options(headers: headers));
    return response.data;
  }

  Future<dynamic> post(String endPoint, Map<String, dynamic>? data,
      {Map<String, dynamic>? headers}) async {
    final response = await dio.post(endPoint,
        data: data, options: Options(headers: headers));
    return response.data;
  }
}
