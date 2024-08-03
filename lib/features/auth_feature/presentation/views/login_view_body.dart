
import 'dart:io';

import 'package:ecommerceapp/features/auth_feature/presentation/cubits/signInCubit/sign_in_cubit.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/signup_view.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/widgets/custom_divider.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/widgets/custom_social_button.dart';
import 'package:ecommerceapp/utils/assets.dart';
import 'package:ecommerceapp/utils/color.dart';
import 'package:ecommerceapp/utils/widgets/custom_button.dart';
import 'package:ecommerceapp/utils/widgets/custom_password_field.dart';
import 'package:ecommerceapp/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email , password;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
             CustomTextFormField(
              onSaved: (p0)
              {
                email = p0!;
              },
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
             CustomPasswordField(
              onSaved: (p0)
              {
                password = p0!;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: AppColor.lightPrimaryColor,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomButton(text: 'تسجيل دخول' ,
                onPressed: ()
                {
                  if(formKey.currentState!.validate())
                  {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword( email, password);
                  }else
                  {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'لا تملك حساب؟',
                    style: TextStyle(
                      color: Color(0xFF949D9E),
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xFF616A6B),
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, SignupView.routeName);
                      },
                    text: 'قم بانشاء حساب',
                    style: const TextStyle(
                      color: Color(0xFF1B5E37),
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 33,
            ),
            const CustomDivider(),
            const SizedBox(
              height: 16,
            ),
             CustomSocialButton(
               onTap: ()
               {
                 context.read<SignInCubit>().signInWithGoogle();
               },


              btnName: 'تسجيل بواسطة جوجل',
              btnImage: Assets.socialGoogleIcon,
            ),
            const SizedBox(
              height: 16,
            ),
          Platform.isIOS ?   Column(
               children: [
                 CustomSocialButton(
                  onTap: (){},
                  btnName: 'تسجيل بواسطة ابل',
                  btnImage: Assets.socialAppleIcon,
                             ),
                 const SizedBox(
                   height: 16,
                 ),
               ],
             ): const SizedBox(),

             CustomSocialButton(
              onTap: ()
              {
                context.read<SignInCubit>().signInWithFacebook();
              },
              btnName: 'تسجيل بواسطة فيسبوك',
              btnImage: Assets.socialFaceBookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
