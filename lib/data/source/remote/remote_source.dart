
import 'package:news_app/data/model/remote_articles.dart';

abstract class RemoteSource{
  Future<RemoteArticles> getRemoteArticles();
}