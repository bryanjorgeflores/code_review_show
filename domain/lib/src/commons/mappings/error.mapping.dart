import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorMapping {
  toThrow(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError) {
        throw NoNetwork();
      }
      if (error.type == DioExceptionType.unknown) {
        throw BadRequest(message: (error.error as dynamic).message);
      }
      var statusCode = error.response?.statusCode;
      switch (statusCode) {
        case 400:
          throw BadRequest();
        case 401:
          throw Unauthorized();
        case 412:
          throw PreconditionFailed();
        default:
          throw Unexpected();
      }
    } else {
      throw Unexpected();
    }
  }
}
