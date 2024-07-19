import 'package:injectable/injectable.dart';
import 'package:news_app/domain/interactor/article_details_use_case.dart';
import 'package:news_app/domain/model/article_details.dart';
import 'package:news_app/domain/model/result.dart';
import 'package:news_app/presentation/core/result_view_model.dart';

@Injectable()
class ArticleDetailsViewModel extends ResultViewModel<ArticleDetails>{

  final ArticleDetailUseCase _articleDetailUseCase;
  Result<ArticleDetails>? _resultArticleDetails;

  ArticleDetailsViewModel(this._articleDetailUseCase);

  void loadArticleDetails(int id){
    doLoad(() => this._articleDetailUseCase.getArticles(id));
  }

  @override
  Result<ArticleDetails>? get result => _resultArticleDetails;

  @override
  set result(Result<ArticleDetails>? result) {
    _resultArticleDetails = result;
  }
}