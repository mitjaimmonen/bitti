class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);
}
