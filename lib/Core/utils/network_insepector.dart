import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request: ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response Status: ${response.statusCode}');
    print('Response Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('DioException: $err');
    print('Error Message: ${err.message}');
    print('Error Response: ${err.response?.data}');
    handler.next(err);
  }
}
