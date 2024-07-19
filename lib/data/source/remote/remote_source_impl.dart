import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/remote_articles.dart';
import 'package:news_app/data/model/remote_articles_query.dart';
import 'package:news_app/data/network/method.dart';
import 'package:news_app/data/network/remote_service_provider.dart';
import 'package:news_app/data/source/remote/remote_source.dart';

@LazySingleton(as: RemoteSource, env: [Environment.prod])
class RemoteSourceImpl with RemoteServiceProvider implements RemoteSource{
  @override
  String get getBaseUrl =>  "https://api.nytimes.com";

  static const String _articles = '/svc/topstories/v2/world.json';

  @override
  Future<RemoteArticles> getRemoteArticles() {
    return call(Method.get, _articles, query: RemoteArticleQuery());
  }

}