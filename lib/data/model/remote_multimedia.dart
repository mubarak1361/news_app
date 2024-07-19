import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/dynamic_extension.dart';

@Injectable()
class RemoteMultimedia {
  final String url;
  final String format;
  final num height;
  final num width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  @factoryMethod
  RemoteMultimedia.fromJson(@factoryParam Map<String, dynamic>? json)
      : url = json.getString("url"),
        format = json.getString("format"),
        height = json.getNumber("height"),
        width = json.getNumber("width"),
        type = json.getString("type"),
        subtype = json.getString("subtype"),
        caption = json.getString("caption"),
        copyright = json.getString("copyright");
}
