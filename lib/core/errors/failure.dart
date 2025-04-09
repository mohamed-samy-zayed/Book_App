import 'package:dio/dio.dart';

abstract class Failure {
  final String erorrMessage;

  Failure({required this.erorrMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.erorrMessage});

  factory ServerFailure.fromdDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(erorrMessage: 'Connection Timeout With Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(erorrMessage: 'Send Timeout With Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(erorrMessage: 'Receive Timeout With Server');

      case DioExceptionType.badCertificate:
        return ServerFailure(erorrMessage: 'Bad Certificate With Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(erorrMessage: 'Request Cancel');

      case DioExceptionType.connectionError:
        return ServerFailure(erorrMessage: 'Connection Error');

      case DioExceptionType.unknown:
      if(dioException.message!.contains('SocketException')){

        return ServerFailure(erorrMessage: 'N Internet Connection');
      }
        return ServerFailure(erorrMessage: 'Unknown Error');

    default:
    return ServerFailure(erorrMessage: 'There Was an Error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic failure) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(erorrMessage: failure['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(erorrMessage: 'Your Request Not Found');
    } else if (statusCode == 500) {
      return ServerFailure(erorrMessage: 'Internal Server Error');
    }else{
      return ServerFailure(erorrMessage: 'There Was an Error');
    }
  }
}
