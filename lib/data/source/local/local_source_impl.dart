
import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/remote_article.dart';
import 'package:news_app/data/source/local/local_source.dart';

@LazySingleton(as: LocalSource)
class LocalSourceImpl implements LocalSource{

  @override
  List<RemoteArticle>? remoteArticles;

  @override
  void clear() {
    remoteArticles = null;
  }

}