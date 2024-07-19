import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/model/remote_article.dart';
import 'package:news_app/domain/model/article.dart';
import 'package:news_app/domain/model/article_details.dart';

@LazySingleton()
class DataToDomainMapper {

  List<Article> transformArticles(List<RemoteArticle> remoteArticles) {

    return remoteArticles
        .mapIndexed((index, article) =>
        Article(
            id: index,
            title: article.title,
            author: article.byline,
            image: article.multimedia
                .where((element) => element.format == 'Super Jumbo')
                .firstOrNull
                ?.url ?? '',
            publishedDate: _formatPublishedDate(article.publishedDate))).toList();
  }

  ArticleDetails transformArticleDetails(RemoteArticle remoteArticle) {
    final media = remoteArticle.multimedia
        .where((element) => element.format == 'Super Jumbo')
        .firstOrNull;
    return ArticleDetails(title: remoteArticle.title,
        description: remoteArticle.abstract,
        author: remoteArticle.byline,
        image: media?.url ?? '',
        region: remoteArticle.subsection,
        publishedDat: _formatPublishedDate(remoteArticle.publishedDate),
        imageCaption: media?.caption ?? '',
        imageCopyright:  media?.copyright ?? '',
        readMoreLink: remoteArticle.url);
  }

  String _formatPublishedDate(String date){
    final sourceSdf = DateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZ").parse(date);
    return DateFormat("EEE, dd MMM yyy hh:mm a").format(sourceSdf);

  }
}