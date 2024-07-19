import 'package:news_app/domain/model/result.dart';
import 'package:news_app/presentation/core/view_state.dart';
import 'package:flutter/foundation.dart';

abstract class ViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  late final ValueSetter<String> failureMessage;

  void setState(ViewState viewState) {
    _state = viewState;
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<D?> doPerform<D>(ValueGetter<Future<Result<D>>> call) async {
    setState(ViewState.busy);
    final result = await call();
    final D? data;
    if (result.isSuccess) {
      data = result.successData;
    } else {
      failureMessage(result.failureData!);
      data = null;
    }
    setState(ViewState.idle);
    return data;
  }

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }
}
