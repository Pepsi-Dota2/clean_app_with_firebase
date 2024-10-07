import 'package:clean_app/core/usecase/use_case.dart';
import 'package:clean_app/module/profile/domain/usecase/profile_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;
  ProfileCubit(this._profileUseCase) : super(const ProfileState.initial());

  Future<void> userProfile() async {
    emit(const ProfileState.loading());
    final user = await _profileUseCase(NoParams());
    user.fold(
      (l) => emit(ProfileState.failure(l.message)),
      (r) {
        if (r?.email == "") {
          emit(const ProfileState.empty());
        } else {
          emit(ProfileState.success(r));
        }
      },
    );
  }
}
