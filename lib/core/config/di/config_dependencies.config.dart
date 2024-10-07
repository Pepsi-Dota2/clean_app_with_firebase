// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_app/core/config/di/module.dart' as _i1033;
import 'package:clean_app/core/service/api_auth.dart' as _i501;
import 'package:clean_app/module/auth/login/data/datasource/login_local_datasource.dart'
    as _i590;
import 'package:clean_app/module/auth/login/data/datasource/login_remote_datasoruce.dart'
    as _i620;
import 'package:clean_app/module/auth/login/data/repository/login_repository_impl.dart'
    as _i476;
import 'package:clean_app/module/auth/login/domain/repository/login_repository.dart'
    as _i223;
import 'package:clean_app/module/auth/login/domain/usecase/login_usecase.dart'
    as _i965;
import 'package:clean_app/module/auth/login/presentation/cubit/login_cubit.dart'
    as _i493;
import 'package:clean_app/module/profile/data/datasource/profile_remote_datasource.dart'
    as _i368;
import 'package:clean_app/module/profile/data/repository/profile_repository_impl.dart'
    as _i690;
import 'package:clean_app/module/profile/domain/repository/profile_repository.dart'
    as _i79;
import 'package:clean_app/module/profile/domain/usecase/profile_usecase.dart'
    as _i930;
import 'package:clean_app/module/profile/presentation/cubit/profile_cubit.dart'
    as _i316;
import 'package:clean_app/routes/routes.dart' as _i372;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i372.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => injectableModule.secureStorage);
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i590.LoginLocalDatasource>(
        () => _i590.LoginLocalDatasourceImpl());
    gh.lazySingleton<_i501.ApiAuth>(() => _i501.ApiAuth(gh<_i361.Dio>()));
    gh.lazySingleton<_i368.ProfileRemoteDatasource>(() =>
        _i368.ProfileRemoteDatasourceImpl(
            firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i620.LoginRemoteDatasoruce>(
        () => _i620.LoginRemoteDatasoruceImpl(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i79.ProfileRepository>(() => _i690.ProfileRepositoryImpl(
        profileRemoteDatasource: gh<_i368.ProfileRemoteDatasource>()));
    gh.lazySingleton<_i930.ProfileUseCase>(() =>
        _i930.ProfileUseCase(profileRepository: gh<_i79.ProfileRepository>()));
    gh.lazySingleton<_i223.LoginRepository>(() => _i476.LoginRepositoryImpl(
          gh<_i590.LoginLocalDatasource>(),
          loginRemoteDatasoruce: gh<_i620.LoginRemoteDatasoruce>(),
        ));
    gh.lazySingleton<_i965.LoginUseCase>(
        () => _i965.LoginUseCase(gh<_i223.LoginRepository>()));
    gh.factory<_i493.LoginCubit>(
        () => _i493.LoginCubit(gh<_i965.LoginUseCase>()));
    gh.factory<_i316.ProfileCubit>(
        () => _i316.ProfileCubit(gh<_i930.ProfileUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i1033.InjectableModule {}
