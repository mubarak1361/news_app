import 'package:news_app/core/di/di_configuration.dart';

mixin JsonMapper {
  List<T> mapJson<T extends Object>(dynamic elements) {
    List<T> list = [];
    if (elements != null) {
      for (final element in elements) {
        final item = locator<T>(param1: element);
        list.add(item);
      }
    }
    return list;
  }
}
