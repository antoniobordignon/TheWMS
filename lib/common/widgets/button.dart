import 'package:flutter/material.dart';
import 'package:thewms/common/constants/text_style.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  
  const Button({
    super.key,
    this.onPressed,
    required this.text
  });

  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Colors.deepPurple[800]
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: AppTextStyle.mediumText.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}