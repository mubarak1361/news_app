import 'package:either_dart/either.dart';

class Result<D> {
  final Either<D, String> _either;

  Result.success(D data) : _either = Left<D, String>(data);

  Result.failure(String message) : _either = Right<D, String>(message);

  T when<T>(
      {required T Function(D) onSuccess,
      required T Function(String) onFailure}) {
    return _either.fold<T>(onSuccess, onFailure);
  }

  bool get isSuccess => _either.isLeft;

  bool get isFailure => _either.isRight;

  D? get successData => isSuccess ? _either.left : null;

  String? get failureData => isFailure ? _either.right : null;
}
