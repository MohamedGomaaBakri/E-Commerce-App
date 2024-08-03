import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 17),
            child: Divider(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'أو',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0C0D0D),
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 17),
          child: Divider(),
        )),
      ],
    );
  }
}
