import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

//get logger
Logger getLogger(String className) {
  return Logger(printer: AppLogger(className));
}

//log util to print log
class AppLogger extends PrettyPrinter {
  final String className;

  AppLogger(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    List<String> logs = [];
    if (color != null && kDebugMode) {
      logs.add(
          '==========================================================================');
      logs.add((color('[ $emoji $className - ${event.message} ]')));
      logs.add(
          '==========================================================================');
    }
    return logs;
  }
}
