import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection Time Out with Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send Time Out with Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Recieve Time Out with Server');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request Canceled');
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        } else {
          return ServerFailure(errorMessage: 'Unexpected Error, Try Again');
        }
      default:
        return ServerFailure(errorMessage: 'Unexpected Error, Try Again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      //Access the error message in error map in api
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: 'Your Requested Content Not Found Try Again Later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: 'Internal Server Error Try Again Later');
    } else {
      return ServerFailure(errorMessage: response['error']['message']);
    }
  }
}
