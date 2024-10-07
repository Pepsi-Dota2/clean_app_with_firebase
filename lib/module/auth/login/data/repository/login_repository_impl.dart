import 'package:clean_app/core/error/failures.dart';
import 'package:clean_app/module/auth/login/data/datasource/login_local_datasource.dart';
import 'package:clean_app/module/auth/login/domain/repository/login_repository.dart';
import 'package:clean_app/module/auth/login/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../datasource/login_remote_datasoruce.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasoruce _loginRemoteDatasoruce;
  final LoginLocalDatasource _localDatasource;

  LoginRepositoryImpl(this._localDatasource, {required LoginRemoteDatasoruce loginRemoteDatasoruce}) : _loginRemoteDatasoruce = loginRemoteDatasoruce;

  @override
  Future<Either<Failure, UserCredential>> userLogin(LoginParams params) async {
    final response = await _loginRemoteDatasoruce.userLogin(params);
    return response.fold(
      (failure) => Left(failure),
      (res) async {
        await _localDatasource.saveUser(uid: res.user?.uid ?? "");
        return Right(res);
      },
    );
  }
}
