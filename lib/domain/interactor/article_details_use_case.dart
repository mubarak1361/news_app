import 'package:news_app/domain/model/article_details.dart';
import 'package:news_app/domain/model/result.dart';

abstract class ArticleDetailUseCase{
  Future<Result<ArticleDetails>> getArticles(int id);
}