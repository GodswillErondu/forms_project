// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:forms_project/application/form/form_bloc.dart' as _i672;
import 'package:forms_project/domain/form/repositories/i_form_repository.dart'
    as _i1047;
import 'package:forms_project/infrastructure/form/dtos/form_dto.dart' as _i682;
import 'package:forms_project/infrastructure/form/form_repository.dart'
    as _i515;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1047.IFormRepository>(
      () => _i515.FormRepository(gh<_i979.Box<_i682.FormDto>>()),
    );
    gh.factory<_i672.FormBloc>(
      () => _i672.FormBloc(gh<_i1047.IFormRepository>()),
    );
    return this;
  }
}
