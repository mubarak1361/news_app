import 'package:flutter/foundation.dart';
import 'package:news_app/core/failures/api_failure.dart';
import 'package:news_app/core/failures/generic_failure.dart';
import 'package:news_app/core/failures/network_failure.dart';
import 'package:news_app/domain/model/result.dart';

mixin UseCase {
  Future<Result<T>> getResult<T>(Future<T> data) {
    return data.then((data) => Result.success(data)).onError(_onHandleError);
  }

  Result<T> _onHandleError<T>(dynamic error, StackTrace stackTrace) {
    switch (error.runtimeType) {
      case APIFailure:
      case GenericFailure:
      case NetworkFailure:
        return Result<T>.failure(error.toString());
      default:
        debugPrint('${error.toString()}\n${stackTrace.toString()}');
        return Result<T>.failure(
            'Please contact the support team to report an issue');
    }
  }
}