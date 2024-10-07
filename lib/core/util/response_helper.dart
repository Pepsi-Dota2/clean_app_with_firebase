import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exceptions.dart';

class ResponseHelper {
  static Exception returnResponse(DioException dioException) {
    try {
      if (dioException.error.runtimeType == SocketException && dioException.type == DioExceptionType.connectionError) {
        return const SocketException("No Internet");
      } else if (dioException.type == DioExceptionType.connectionTimeout) {
        return ConnectionException("Internet Timeout");
      } else {
        return ServerException(dioException.response?.data['message'] ?? "Something went worng");
      }
    } on DioException catch (dioException) {
      return ServerException(dioException.response?.data['message'] ?? "Something went worng");
    }
  }
}
