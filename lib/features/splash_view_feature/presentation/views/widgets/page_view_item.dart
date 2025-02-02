import 'package:ecommerceapp/features/auth_feature/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.backgroundImage,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.isVisible});

  final String backgroundImage;
  final String image;
  final Widget title;
  final Widget subTitle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginView.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Visibility(
                    visible: isVisible,
                    child: const Text(
                      'تخط',
                      style: TextStyle(
                        color: Color(0xFF949D9E),
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        subTitle,
      ],
    );
  }
}
