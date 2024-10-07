import 'package:clean_app/module/auth/login/domain/usecase/login_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  Future<void> userLogin({required String email, required String password}) async {
    emit(const LoginState.loading());
    final res = await _loginUseCase(LoginParams(email: email, password: password));
    res.fold(
      (failure) => emit(LoginState.failure(failure.message)),
      (user) => emit(LoginState.success(user)),
    );
  }
}
