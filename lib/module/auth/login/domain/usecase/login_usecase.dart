import 'package:clean_app/module/auth/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/use_case.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

@lazySingleton
class LoginUseCase extends UseCase<UserCredential, LoginParams> {
  final LoginRepository _repo;

  LoginUseCase(this._repo);

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) => _repo.userLogin(params);
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({@Default("") String email, @Default("") String password}) = _LoginParams;
  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);
}
