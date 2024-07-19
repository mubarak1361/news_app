import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/article_details.dart';

abstract class Repository{

  Future<List<Article>> getArticles();

  Future<ArticleDetails> getArticleDetails(int id);
}