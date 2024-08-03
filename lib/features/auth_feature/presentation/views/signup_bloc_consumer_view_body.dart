import 'package:ecommerceapp/features/auth_feature/presentation/cubits/signupcubit/sign_up_cubit.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpBlocConsumerViewBody extends StatelessWidget {
  const SignUpBlocConsumerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state)
      {
        if(state is SignUpSuccess)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم التسجيل بنجاح'),
            ),
          );
        }
        if(state is SignUpFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return  ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
            child: const SignupViewBody()
        );
      },
    );
  }
}
