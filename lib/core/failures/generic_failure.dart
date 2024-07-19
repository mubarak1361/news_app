class GenericFailure implements Exception {
  final String? _message;
  final String? _prefix;

  GenericFailure([this._message, this._prefix = '']);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}
