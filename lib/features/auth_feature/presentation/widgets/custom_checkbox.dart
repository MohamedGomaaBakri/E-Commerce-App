import 'package:ecommerceapp/utils/assets.dart';
import 'package:ecommerceapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: const Color(0xFFDCDEDE),
          ),
          color: isChecked ? AppColor.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(Assets.checkedlogo),
              )
            : SizedBox(),
      ),
    );
  }
}
