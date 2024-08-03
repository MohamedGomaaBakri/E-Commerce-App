import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerceapp/features/auth_feature/presentation/views/login_view.dart';
import 'package:ecommerceapp/utils/color.dart';
import 'package:ecommerceapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'custom_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController myController;
  var currentPage = 0;
  @override
  void initState() {
    myController = PageController();
    myController.addListener(
      () {
        currentPage = myController.page!.round();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: CustomPageView(
          myController: myController,
        ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColor.primaryColor,
            color: currentPage == 1
                ? AppColor.primaryColor
                : AppColor.primaryColor.withOpacity(.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 43),
          child: Visibility(
            visible: currentPage == 1,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
      ],
    );
  }
}
