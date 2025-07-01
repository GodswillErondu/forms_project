abstract class Failure<T> {}

class ValidationFailure<T> implements Failure<T> {
  final String message;
  ValidationFailure({required this.message});
}

class RepositoryFailure<T> implements Failure<T> {
  final String message;
  RepositoryFailure({required this.message});
}

