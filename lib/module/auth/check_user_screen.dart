import 'package:auto_route/auto_route.dart';
import 'package:clean_app/constants/keys/key_constants.dart';
import 'package:clean_app/core/config/di/config_dependencies.dart';
import 'package:clean_app/module/auth/login/presentation/cubit/login_cubit.dart';
import 'package:clean_app/module/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_app/module/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login/presentation/login_screen.dart';

@RoutePage()
class CheckUserScreen extends StatelessWidget implements AutoRouteWrapper {
  const CheckUserScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    Future<StatelessWidget> checkUser() async {
      const secure = FlutterSecureStorage();
      final user = await secure.read(key: KeyConstants.uid) ?? "";
      if (user != "") {
        return BlocProvider(create: (context) => getIt<ProfileCubit>()..userProfile(), child: const ProfileScreen());
      } else {
        return BlocProvider(create: (context) => getIt<LoginCubit>(), child: LoginScreen());
      }
    }

    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: FutureBuilder(
        future: checkUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data;
          } else {
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
