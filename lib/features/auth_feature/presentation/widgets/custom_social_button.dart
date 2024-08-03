import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton(
      {super.key, required this.btnName, required this.btnImage, required this.onTap});

  final String btnName, btnImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 32,
              ),
              SvgPicture.asset(btnImage),
              const SizedBox(
                width: 53,
              ),
              Text(
                textAlign: TextAlign.center,
                btnName,
                style: const TextStyle(
                  color: Color(0xFF0C0D0D),
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
