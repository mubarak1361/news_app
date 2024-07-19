import 'package:news_app/domain/model/result.dart';
import 'package:news_app/presentation/core/view_model.dart';
import 'package:news_app/presentation/core/view_state.dart';
import 'package:flutter/foundation.dart';

abstract class ResultViewModel<T> extends ViewModel {
  Result<T>? get result;

  set result(Result<T>? result);

  Future doLoad(ValueGetter<Future<Result<T>>> call) async {
    setState(ViewState.busy);
    result = await call();
    setState(ViewState.idle);
  }

  Future doRefresh(ValueGetter<Future<Result<T>>> call) async {
    setState(ViewState.busy);
    final newResult = await call();
    if (newResult.isSuccess) {
      result = newResult;
    } else if (result != null && result!.isSuccess && newResult.isFailure) {
      failureMessage(newResult.failureData!);
    }
    setState(ViewState.idle);
  }

  bool enableSwipeRefresh() {
    return false;
  }
}
