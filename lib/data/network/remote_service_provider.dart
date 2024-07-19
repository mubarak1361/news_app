import 'dart:convert';
import 'dart:io';
import 'package:news_app/core/app_logger.dart';
import 'package:news_app/core/di/di_configuration.dart';
import 'package:news_app/core/failures/api_failure.dart';
import 'package:news_app/core/failures/generic_failure.dart';
import 'package:news_app/core/failures/network_failure.dart';
import 'package:news_app/data/network/error_response.dart';
import 'package:news_app/data/network/map_request.dart';
import 'package:news_app/data/network/method.dart';
import 'package:news_app/data/network/query.dart';
import 'package:http/http.dart';

mixin RemoteServiceProvider {
  final log = getLogger('API');

  String get getBaseUrl;

  final String _tagRequest = '====== Request =====>';
  final String _tagResponse = '====== Response =====>';

  final JsonDecoder _decoder = const JsonDecoder();

  final Map<String, String> _headers = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future _call(
      {required String path,
      Map<String, String>? headers,
      Encoding? encoding,
      required Method method,
      MapRequest? body,
      Query? query}) async {
    Response response;
    final url = Uri.parse('$getBaseUrl$path${_getQueryParams(query)}');
    log.i('$_tagRequest $url');
    if (headers == null) {
      headers = _headers;
    } else {
      headers.addAll(_headers);
    }
    try {
      switch (method) {
        case Method.get:
          response = await get(url, headers: headers);
          break;
        case Method.post:
          response = await post(url,
              body: json.encode(body?.toMap()),
              headers: headers,
              encoding: encoding);
          break;
        case Method.put:
          response = await put(url,
              body: json.encode(body?.toMap()),
              headers: headers,
              encoding: encoding);
          break;
        case Method.delete:
          response = await delete(url, headers: headers);
          break;
      }
      log.i('Response Status => ${response.statusCode}');
      log.i('$_tagResponse ${response.body}');
    } on SocketException {
      throw NetworkFailure(
          'Whoops, no internet connection found.\nPlease check your connection');
    }
    return _returnResponse(response);
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        var responseJson = _decoder.convert(response.body);
        return responseJson;
      default:
        try {
          final responseJson = _decoder.convert(response.body);
          final errorResponse = ErrorResponse.fromJson(responseJson);
          throw APIFailure(errorResponse);
        } on APIFailure catch (_, __) {
          rethrow;
        } catch (e) {
          throw GenericFailure(
              'Error occurred while Communication with Server with ${response.statusCode} StatusCode');
        }
    }
  }

  Future<T> call<T extends Object>(Method method, String path,
      {Query? query, MapRequest? body}) {
    return _call(method: method, path: path, query: query, body: body)
        .then((map) => locator<T>(param1: map));
  }

  Future<List<T>> callForArray<T extends Object>(Method method, String path,
      {Query? query, MapRequest? body}) {
    return _call(method: method, path: path, query: query, body: body)
        .then((elements) {
      final List<T> items = [];
      for (final element in elements) {
        final item = locator<T>(param1: element);
        items.add(item);
      }
      return items;
    });
  }

  String _getQueryParams(Query? query) {
    String params = '';
    query?.toMap().forEach((key, value) {
      if (params.isNotEmpty) {
        params += '&$key=$value';
      } else {
        params += '$key=$value';
      }
    });
    return params.isNotEmpty ? '?$params' : '';
  }
}
