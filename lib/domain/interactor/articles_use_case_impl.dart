import 'package:injectable/injectable.dart';
import 'package:news_app/domain/interactor/articles_use_case.dart';
import 'package:news_app/domain/interactor/use_case.dart';
import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/result.dart';
import 'package:news_app/domain/repo/repository.dart';

@Injectable(as: ArticlesUseCase)
class ArticlesUseCaseImpl with UseCase implements ArticlesUseCase{

  final Repository _repository;

  ArticlesUseCaseImpl(this._repository);

  @override
  Future<Result<List<Article>>> getArticles() {
    return getResult(_repository.getArticles());
  }
}