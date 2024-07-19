import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/di/di_configuration.config.dart';


GetIt locator = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
GetIt configureDependencies(String environment) =>
    locator.$initGetIt(environment: environment);
