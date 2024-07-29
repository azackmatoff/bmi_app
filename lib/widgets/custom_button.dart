import 'package:bmi_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onTap;
  final TextStyle? buttonTextStyle;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(
            color: AppColors.pinkDark,
          ),
          child: Text(
            buttonText.toUpperCase(),
            style: buttonTextStyle ?? Theme.of(context).textTheme.headlineMedium!,
            // style: _getButtonTextStyle(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  TextStyle _getButtonTextStyle(BuildContext context) {
    if (buttonTextStyle != null) {
      return buttonTextStyle!;
    } else {
      return Theme.of(context).textTheme.headlineMedium!;
    }
  }
}
