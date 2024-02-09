import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:nomabe/core/data/dependency/dependencyinjection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();
