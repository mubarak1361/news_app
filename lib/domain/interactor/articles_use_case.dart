import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/result.dart';

abstract class ArticlesUseCase{
  Future<Result<List<Article>>> getArticles();
}