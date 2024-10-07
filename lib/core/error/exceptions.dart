abstract class AppException {
  final String message;

  AppException(this.message);
}

class ServerException extends AppException implements Exception {
  ServerException(super.message);
}

class CacheException extends AppException implements Exception {
  CacheException(super.message);
}

class ConnectionException extends AppException implements Exception {
  ConnectionException(super.message);
}
