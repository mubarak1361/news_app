import 'package:news_app/data/network/base_json.dart';

class ErrorResponse implements BaseJson {
  late num _status;
  late String _code;
  late String _message;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  void fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _status = json['data']['status'];
  }

  String get success => _code;

  String get message => _message;

  num get status => _status;
}
