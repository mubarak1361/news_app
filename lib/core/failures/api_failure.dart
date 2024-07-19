import 'package:news_app/core/failures/generic_failure.dart';
import 'package:news_app/data/network/error_response.dart';

class APIFailure extends GenericFailure {
  final ErrorResponse _errorResponse;

  APIFailure(this._errorResponse);

  @override
  String toString() {
    final formattedError = _errorResponse.message;
    return formattedError;
  }
}
