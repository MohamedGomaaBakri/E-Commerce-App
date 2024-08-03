import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({
    super.key, required this.onChanged,
  });
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        CustomCheckbox(
          onChecked: (value) {
            termsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: termsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyle(
                    color: Color(0xFF949D9E),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyle(
                    color: Color(0xFF2D9F5D),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
