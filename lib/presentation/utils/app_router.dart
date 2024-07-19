import 'package:flutter/material.dart';
import 'package:news_app/core/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/pages/article/detail/article_details_page.dart';
import 'package:news_app/presentation/pages/article/list/article_list_page.dart';
import 'package:news_app/presentation/utils/app_colors.dart';

class AppRouter {
  AppRouter._();

  static final _log = getLogger('Router');

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _log.i(
        'generateRoute | to :${settings.name} arguments:${settings.arguments}');
    switch (settings.name) {
      case ArticleListPage.routeName:
        return _buildPageRoute(ArticleListPage(), settings);
      case ArticleDetailsPage.routeName:
        return _buildPageRoute(ArticleDetailsPage(id: settings.arguments as int), settings);
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }

  static CupertinoPageRoute _buildPageRoute(
      Widget widget, RouteSettings settings) {
    return CupertinoPageRoute(builder: (_) => Material(
        color: AppColors.primaryGrey,
        child: widget), settings: settings);
  }

  static PageRouteBuilder _buildStartPageRoute(
      Widget widget, RouteSettings settings,
      {bool opaque = true}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      settings: settings,
      opaque: opaque,
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static String get initialRoute => ArticleListPage.routeName;
}
