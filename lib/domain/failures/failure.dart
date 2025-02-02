abstract class Failure {}

class GeneralFailure extends Failure {
  final String message;

  GeneralFailure({required this.message});
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({required this.message});
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({required this.message});
}

class DataSourceFailure extends Failure {
  final String message;

  DataSourceFailure({required this.message});
}

class NotFoundFailure extends Failure {
  final String message;

  NotFoundFailure({required this.message});
}
