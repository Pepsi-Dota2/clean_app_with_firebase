import 'package:auto_route/auto_route.dart';
import 'package:clean_app/module/auth/login/presentation/cubit/login_cubit.dart';
import 'package:clean_app/module/auth/login/presentation/widgets/password_input.dart';
import 'package:clean_app/module/auth/login/presentation/widgets/text_input.dart';
import 'package:clean_app/module/widgets/failure_dialog.dart';
import 'package:clean_app/module/widgets/loading_dialog.dart';
import 'package:clean_app/module/widgets/radius_button.dart';
import 'package:clean_app/routes/routes.dart';
import 'package:clean_app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/di/config_dependencies.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }

  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => LoadingDialog.showLoadingDialog(context),
          success: (user) {
            LoadingDialog.hideLoadingDialog(context);
            getIt<AppRouter>().replaceAll([ProfileRoute()]);
          },
          failure: (message) {
            LoadingDialog.hideLoadingDialog(context);
            failureDialog(context: context, message: message);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextInput(controller: emailController, hintText: "example@gmail.com", header: "Email"),
                    const SizedBox(height: 12),
                    PasswordInput(controller: pwdController, hintText: "***********", header: "Password"),
                    const SizedBox(height: 30),
                    RadiusButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() != false) {
                          final email = emailController.text.trim();
                          final pwd = pwdController.text.trim();
                          context.read<LoginCubit>().userLogin(email: email, password: pwd);
                        }
                      },
                      title: "Sign In",
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
