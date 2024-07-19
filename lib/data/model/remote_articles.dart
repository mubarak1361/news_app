import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/dynamic_extension.dart';
import 'package:news_app/data/model/remote_article.dart';
import 'package:news_app/data/network/json_mapper.dart';

@Injectable()
class RemoteArticles with JsonMapper {
  final String status;
  final String copyright;
  final String section;
  final String lastUpdated;
  final num numResults;
  late final List<RemoteArticle> results;

  @factoryMethod
  RemoteArticles.fromJson(@factoryParam Map<String, dynamic>? json)
      : status = json.getString("status"),
        copyright = json.getString("copyright"),
        section = json.getString("section"),
        lastUpdated = json.getString("lastUpdated"),
        numResults = json.getNumber("numResults") {
    results = mapJson(json?['results']);
  }
}
