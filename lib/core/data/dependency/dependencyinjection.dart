import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);
