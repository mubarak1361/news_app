import 'package:news_app/data/network/query.dart';

class RemoteArticleQuery implements Query{

  final String _apiKey = 'api-key';

  RemoteArticleQuery();

  @override
  Map<String, dynamic> toMap() {
    final Map<String,dynamic> query = {};
    query[_apiKey] = "<your-api-key-here>";
    return query;
  }

}