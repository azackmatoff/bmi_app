import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WeightAndAgeWidget extends StatelessWidget {
  final String aty;
  final String san;
  final Function() koboyt;
  final Function() azayt;
  final String koboytTag;
  final String azaytTag;
  const WeightAndAgeWidget({
    super.key,
    required this.san,
    required this.aty,
    required this.koboyt,
    required this.azayt,
    required this.koboytTag,
    required this.azaytTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.greyBlueDarker,
      ),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Text(
            aty.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            san,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: koboytTag,
                onPressed: koboyt,
                backgroundColor: AppColors.greyBlueLight,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                heroTag: azaytTag,
                onPressed: azayt,
                backgroundColor: AppColors.greyBlueLight,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.remove,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
