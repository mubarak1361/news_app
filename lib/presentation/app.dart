import 'package:news_app/presentation/utils/app_constants.dart';
import 'package:news_app/presentation/utils/app_router.dart';
import 'package:news_app/presentation/utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getLight(context),
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
