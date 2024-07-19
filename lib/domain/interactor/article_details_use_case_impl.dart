import 'package:injectable/injectable.dart';
import 'package:news_app/domain/interactor/article_details_use_case.dart';
import 'package:news_app/domain/interactor/use_case.dart';
import 'package:news_app/domain/model/article_details.dart';
import 'package:news_app/domain/model/result.dart';
import 'package:news_app/domain/repo/repository.dart';

@Injectable(as: ArticleDetailUseCase)
class ArticleDetailsUseCaseImpl with UseCase implements ArticleDetailUseCase{

  final Repository _repository;

  ArticleDetailsUseCaseImpl(this._repository);

  @override
  Future<Result<ArticleDetails>> getArticles(int id) {
    return getResult(_repository.getArticleDetails(id));
  }
}