// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nomabe/list/data/repository/listrepository.dart' as _i8;
import 'package:nomabe/list/data/service/listservice.dart' as _i6;
import 'package:nomabe/list/domain/listinteractor.dart' as _i11;
import 'package:nomabe/list/presentation/cubit/listcubit.dart' as _i5;
import 'package:nomabe/talkwithai/data/repository/listrepository.dart' as _i10;
import 'package:nomabe/talkwithai/data/service/listservice.dart' as _i7;
import 'package:nomabe/talkwithai/domain/listinteractor.dart' as _i9;
import 'package:nomabe/talkwithai/presentation/cubit/geminicubit.dart' as _i4;
import 'package:nomabe/talkwithai/presentation/cubit/listcubit.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ListCubit>(() => _i3.ListCubit.create());
    gh.factory<_i4.GeminiCubit>(() => _i4.GeminiCubit.create());
    gh.factory<_i5.ListCubit>(() => _i5.ListCubit.create());
    gh.factory<_i6.ListService>(() => _i6.ListServiceImpl());
    gh.factory<_i7.ListService>(() => _i7.ListServiceImpl());
    gh.factory<_i8.ListRepository>(
        () => _i8.ListRepositoryImpl(gh<_i6.ListService>()));
    gh.factory<_i9.ListInteractor>(
        () => _i9.ListInteractorImpl(gh<_i8.ListRepository>()));
    gh.factory<_i10.ListRepository>(
        () => _i10.ListRepositoryImpl(gh<_i6.ListService>()));
    gh.factory<_i11.ListInteractor>(
        () => _i11.ListInteractorImpl(gh<_i8.ListRepository>()));
    return this;
  }
}
