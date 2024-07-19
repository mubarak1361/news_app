import 'package:injectable/injectable.dart';
import 'package:news_app/domain/interactor/articles_use_case.dart';
import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/result.dart';
import 'package:news_app/presentation/core/result_view_model.dart';

@Injectable()
class ArticleListViewModel extends ResultViewModel<List<Article>>{

  Result<List<Article>>? _resultArticles;

  final ArticlesUseCase _articlesUseCase;

  ArticleListViewModel(this._articlesUseCase);

  void loadArticles() {
    doLoad(() => _articlesUseCase.getArticles());
  }

  @override
  Result<List<Article>>? get result => _resultArticles;

  @override
  set result(Result<List<Article>>? result) {
    _resultArticles = result;
  }

  @override
  bool enableSwipeRefresh() {
   return true;
  }

}