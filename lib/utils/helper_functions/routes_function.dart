import 'package:ecommerceapp/features/auth_feature/presentation/views/login_view.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/signup_view.dart';
import 'package:ecommerceapp/features/splash_view_feature/presentation/views/onboarding_view.dart';
import 'package:ecommerceapp/features/splash_view_feature/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routename:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
