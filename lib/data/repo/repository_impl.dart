import 'package:injectable/injectable.dart';
import 'package:news_app/data/mapper/data_to_domain_mapper.dart';
import 'package:news_app/data/store/data_store.dart';
import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/article_details.dart';
import 'package:news_app/domain/repo/repository.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository{

  final DataStore _dataStore;
  final DataToDomainMapper _mapper;

  RepositoryImpl(this._dataStore, this._mapper);

  @override
  Future<ArticleDetails> getArticleDetails(int id) {
    return _dataStore.getArticle(id).then((value) => _mapper.transformArticleDetails(value));
  }

  @override
  Future<List<Article>> getArticles() {
   return _dataStore.getArticles()
        .then((value) => _mapper.transformArticles(value));
  }

}