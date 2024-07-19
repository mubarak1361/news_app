import 'package:news_app/core/failures/generic_failure.dart';

class NetworkFailure extends GenericFailure {
  NetworkFailure([String? message])
      : super(message);
}
