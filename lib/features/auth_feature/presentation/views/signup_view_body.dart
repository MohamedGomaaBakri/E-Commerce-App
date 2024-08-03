import 'package:device_preview/device_preview.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/cubits/signupcubit/sign_up_cubit.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/widgets/terms_and_condition_widget.dart';
import 'package:ecommerceapp/utils/color.dart';
import 'package:ecommerceapp/utils/widgets/custom_button.dart';
import 'package:ecommerceapp/utils/widgets/custom_password_field.dart';
import 'package:ecommerceapp/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name , email , password ;
 late bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
           CustomTextFormField(
            onSaved: (p0) {
              name = p0!;

            },
            hintText: 'الاسم كامل',
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
           CustomTextFormField(
             onSaved: (p0) {
               email = p0!;
             },
            hintText: 'البريد الالكتروني',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordField(
              onSaved:(p0) {
                password = p0!;
              },
          ),
          const SizedBox(
            height: 16,
          ),
           TermsAndConditionWidget(
            onChanged: (value) {
              isAccepted = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: CustomButton(text: 'إنشاء حساب جديد' ,
              onPressed: ()
              {
                if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                  if (isAccepted) {
                    context.read<SignUpCubit>().createUserWithEmailAndPassword(email, password,name);
                  }else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يجب عليك الموافقة علي الشروط والاحكام'),
                      ),
                    );
                  }
                }else
                {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }
              ,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'تمتلك حساب بالفعل؟',
                  style: TextStyle(
                    color: Color(0xFF949D9E),
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                  text: 'تسجيل دخول',
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
