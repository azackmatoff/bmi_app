import 'package:bmi_app/app/flutter-way/home/business_logic/home_view_biz_logic.dart';
import 'package:bmi_app/app/flutter-way/result/view/result_view.dart';
import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:bmi_app/shared/enums/app_enums.dart';
import 'package:bmi_app/shared/widgets/custom_app_bar.dart';
import 'package:bmi_app/shared/widgets/custom_button.dart';
import 'package:bmi_app/shared/widgets/custom_icon_button.dart';
import 'package:bmi_app/shared/widgets/weight_and_age_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _bizLogic = HomeViewBizLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(title: 'BMI Calculator'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                CustomIconButton(
                  text: 'male',
                  icon: Icons.male,
                  bgColor: _bizLogic.gender == Gender.male
                      ? AppColors.greyBlueDarker
                      : AppColors.greyBlueDark,
                  onTap: () {
                    setState(() {
                      _bizLogic.onGenderSelected(Gender.male);
                    });
                  },
                ),
                const SizedBox(width: 16),
                CustomIconButton(
                  text: 'female',
                  icon: Icons.female,
                  bgColor: _bizLogic.gender == Gender.female
                      ? AppColors.greyBlueDarker
                      : AppColors.greyBlueDark,
                  onTap: () {
                    setState(() {
                      _bizLogic.onGenderSelected(Gender.female);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyBlueDarker,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Text(
                    'height'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.baseline, // Align to baseline
                    textBaseline:
                        TextBaseline.alphabetic, // Specify baseline type
                    children: [
                      Text(
                        _bizLogic.height.toInt().toString(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(width: 2), // Adjust spacing as needed
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Slider(
                    value: _bizLogic.height,
                    min: 50,
                    max: 210,
                    thumbColor: AppColors.pinkDark,
                    activeColor: AppColors.pinkDark,
                    onChanged: (double value) {
                      _bizLogic.onHeightChanged(value);

                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: WeightAndAgeWidget(
                    koboytTag: _bizLogic.weight.toString(),
                    azaytTag: 'salmak',
                    san: _bizLogic.weight.toString(),
                    aty: 'weigth',
                    koboyt: () {
                      setState(() {
                        _bizLogic.onWeightChanged(isIncrement: true);
                      });
                    },
                    azayt: () {
                      setState(() {
                        _bizLogic.onWeightChanged(isIncrement: false);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WeightAndAgeWidget(
                    koboytTag: _bizLogic.age.toString(),
                    azaytTag: 'jash',
                    san: _bizLogic.age.toString(),
                    aty: 'age',
                    koboyt: () {
                      setState(() {
                        _bizLogic.onAgeChanged(isIncrement: true);
                      });
                    },
                    azayt: () {
                      setState(() {
                        _bizLogic.onAgeChanged(isIncrement: false);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ResultView(
                weight: _bizLogic.weight,
                height: _bizLogic.height,
                reset: () {
                  _bizLogic.reset();
                  setState(() {});
                },
              );
            },
          ));
        },
        buttonText: 'calculate',
      ),
    );
  }
}
