import 'package:bmi_app/app/flutter-way/result/business_logic/result_view_biz_logic.dart';
import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:bmi_app/shared/widgets/custom_app_bar.dart';
import 'package:bmi_app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  final int weight;
  final double height;
  final Function() reset;
  const ResultView({
    super.key,
    required this.reset,
    required this.weight,
    required this.height,
  });

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  final ResultViewBizLogic _bizLogic = ResultViewBizLogic();

  @override
  void initState() {
    _bizLogic.onInit(weight: widget.weight, height: widget.height);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(title: 'Result Page'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Results',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyBlueDarker,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _bizLogic.bmiCategory,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.yellow,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _bizLogic.bmiResults.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _bizLogic.bmiDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          widget.reset.call();
          Navigator.pop(context);
        },
        buttonText: 're-calculate',
      ),
    );
  }
}
