import 'package:ecommerceapp/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/cubits/signInCubit/sign_in_cubit.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/signin_bloc_consumer_body.dart';
import 'package:ecommerceapp/utils/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'تسجيل دخول',
            style: TextStyle(
              color: Color(0xFF0C0D0D),
              fontSize: 19,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: BlocProvider(
          create: (context) => SignInCubit(AuthRepoImpl(fireAuthService: FireAuthService())),
          child: const SigninBlocConsumerBody(),
        )
      );

  }
}
