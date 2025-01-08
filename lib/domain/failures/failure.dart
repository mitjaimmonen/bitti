abstract class Failure {}

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

class DatabaseFailure extends Failure {
  final String message;

  DatabaseFailure({required this.message});
}
