import 'package:news_app/data/model/remote_article.dart';

abstract class DataStore{

  Future<List<RemoteArticle>> getArticles();

  Future<RemoteArticle> getArticle(int id);
}