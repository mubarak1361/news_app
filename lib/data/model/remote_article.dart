import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/dynamic_extension.dart';
import 'package:news_app/data/model/remote_multimedia.dart';
import 'package:news_app/data/network/json_mapper.dart';

@Injectable()
class RemoteArticle with JsonMapper {
  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final String updatedDate;
  final String createdDate;
  final String publishedDate;
  final String materialTypeFacet;
  final String kicker;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final String shortUrl;
  late final List<RemoteMultimedia> multimedia;

  @factoryMethod
  RemoteArticle.fromJson(@factoryParam Map<String, dynamic>? json)
      : section = json.getString("section"),
        subsection = json.getString("subsection"),
        title = json.getString("title"),
        abstract = json.getString("abstract"),
        url = json.getString("url"),
        uri = json.getString("uri"),
        byline = json.getString("byline"),
        itemType = json.getString("itemType"),
        updatedDate = json.getString("updatedDate"),
        createdDate = json.getString("updated_date"),
        publishedDate = json.getString("published_date"),
        materialTypeFacet = json.getString("materialTypeFacet"),
        kicker = json.getString("kicker"),
        desFacet = json.getList("desFacet"),
        orgFacet = json.getList("orgFacet"),
        perFacet = json.getList("perFacet"),
        geoFacet = json.getList("geoFacet"),
        shortUrl = json.getString("shortUrl") {
    multimedia = mapJson(json?['multimedia']);
  }
}
