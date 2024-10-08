import 'package:bmi_app/app/bloc-way/cubit/home/cubit/home_view_cubit.dart';
import 'package:bmi_app/app/bloc-way/cubit/home/cubit/home_view_cubit_state.dart';
import 'package:bmi_app/app/bloc-way/cubit/result/view/cubit_result_view.dart';
import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:bmi_app/shared/enums/app_enums.dart';
import 'package:bmi_app/shared/widgets/custom_app_bar.dart';
import 'package:bmi_app/shared/widgets/custom_button.dart';
import 'package:bmi_app/shared/widgets/custom_icon_button.dart';
import 'package:bmi_app/shared/widgets/weight_and_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHomeView extends StatefulWidget {
  const CubitHomeView({super.key});

  @override
  _CubitHomeViewState createState() => _CubitHomeViewState();
}

class _CubitHomeViewState extends State<CubitHomeView> {
  final HomeViewCubit _cubit = HomeViewCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewCubitState>(
      bloc: _cubit,
      builder: (context, state) {
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
                      bgColor: state.gender == Gender.male
                          ? AppColors.greyBlueDarker
                          : AppColors.greyBlueDark,
                      onTap: () {
                        _cubit.onGenderSelected(Gender.male);
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomIconButton(
                      text: 'female',
                      icon: Icons.female,
                      bgColor: state.gender == Gender.female
                          ? AppColors.greyBlueDarker
                          : AppColors.greyBlueDark,
                      onTap: () {
                        _cubit.onGenderSelected(Gender.female);
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
                            state.height.toInt().toString(),
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
                        value: state.height,
                        min: 50,
                        max: 210,
                        thumbColor: AppColors.pinkDark,
                        activeColor: AppColors.pinkDark,
                        onChanged: (double value) {
                          _cubit.onHeightChanged(value);
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
                        koboytTag: state.weight.toString(),
                        azaytTag: 'salmak',
                        san: state.weight.toString(),
                        aty: 'weigth',
                        koboyt: () {
                          _cubit.onWeightChanged(isIncrement: true);
                        },
                        azayt: () {
                          _cubit.onWeightChanged(isIncrement: false);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: WeightAndAgeWidget(
                        koboytTag: state.age.toString(),
                        azaytTag: 'jash',
                        san: state.age.toString(),
                        aty: 'age',
                        koboyt: () {
                          _cubit.onAgeChanged(isIncrement: true);
                        },
                        azayt: () {
                          _cubit.onAgeChanged(isIncrement: false);
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
                  return CubitResultView(
                    weight: state.weight,
                    height: state.height,
                    reset: () {
                      _cubit.reset();
                    },
                  );
                },
              ));
            },
            buttonText: 'calculate',
          ),
        );
      },
    );
  }
}
