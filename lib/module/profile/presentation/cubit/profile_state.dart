part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(User? user) = _Success;
  const factory ProfileState.empty() = _Empty;
  const factory ProfileState.failure(String message) = _Failure;
}
