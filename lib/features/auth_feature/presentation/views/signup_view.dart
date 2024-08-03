import 'package:ecommerceapp/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/cubits/signupcubit/sign_up_cubit.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/signup_bloc_consumer_view_body.dart';
import 'package:ecommerceapp/utils/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'SignupView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'حساب جديد',
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
        create: (context) => SignUpCubit(
          AuthRepoImpl(
            fireAuthService: FireAuthService(),
          ),
        ),
        child: const SignUpBlocConsumerViewBody(),
      ),
    );
  }
}
