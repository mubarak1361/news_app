import 'package:news_app/data/model/remote_article.dart';

abstract class LocalSource {

  List<RemoteArticle> ? get remoteArticles;

  set remoteArticles(List<RemoteArticle>? remoteArticles);

  void clear();
}