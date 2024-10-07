import 'package:clean_app/core/error/failures.dart';
import 'package:clean_app/module/auth/login/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> userLogin(LoginParams params);
}
