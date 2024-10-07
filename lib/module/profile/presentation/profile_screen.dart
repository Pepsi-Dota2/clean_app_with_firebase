import 'package:auto_route/auto_route.dart';
import 'package:clean_app/core/config/di/config_dependencies.dart';
import 'package:clean_app/module/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_app/module/profile/presentation/widgets/profile_empty.dart';
import 'package:clean_app/module/profile/presentation/widgets/profile_failure.dart';
import 'package:clean_app/module/profile/presentation/widgets/profile_loading.dart';
import 'package:clean_app/module/profile/presentation/widgets/profile_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..userProfile(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const ProfileLoading(),
            loading: () => const ProfileLoading(),
            success: (user) => ProfileSuccess(user: user),
            empty: () => const ProfileEmpty(),
            failure: (message) => ProfileFailure(message: message),
          );
        },
      ),
    );
  }
}
