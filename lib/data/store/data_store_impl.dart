import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/remote_article.dart';
import 'package:news_app/data/source/local/local_source.dart';
import 'package:news_app/data/source/remote/remote_source.dart';
import 'package:news_app/data/store/data_store.dart';

@LazySingleton(as: DataStore)
class DataStoreImpl implements DataStore{

  final LocalSource _localSource;
  final RemoteSource _remoteSource;

  DataStoreImpl(this._localSource,this._remoteSource);

  @override
  Future<RemoteArticle> getArticle(int id) {
    if(_localSource.remoteArticles!=null){
      return Future(() => _localSource.remoteArticles![id]);
    }
    return getArticles().then((value) => value[id]);
  }

  @override
  Future<List<RemoteArticle>> getArticles() {
    return _remoteSource.getRemoteArticles()
        .then((value) => value.results)
        .then((value) => _localSource.remoteArticles = value);
  }

}