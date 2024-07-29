import 'package:bmi_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.pinkDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 32),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 96,
                  color: AppColors.white,
                ),
                Text(
                  text.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
