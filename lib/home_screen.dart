import 'dart:developer';

import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/enums/app_enums.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:bmi_app/widgets/custom_button.dart';
import 'package:bmi_app/widgets/custom_icon_button.dart';
import 'package:bmi_app/widgets/weight_and_age_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int tandaldi = 0;

  /// tandaldi == 0 => Jinis tandalgan jok
  /// tandaldi == 1 => Erkek
  /// tandaldi == 2 => Ayal

  Jinis jinis = Jinis.tandalganJok;

  double boy = 160;
  int salmak = 50;
  int jash = 18;

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
                  bgColor: jinis == Jinis.erkek ? AppColors.greyBlueDarker : AppColors.greyBlueDark,
                  // bgColor: erkekTusunBer(),
                  onTap: () {
                    setState(() {
                      jinis = Jinis.erkek;
                    });
                  },
                ),
                const SizedBox(width: 16),
                CustomIconButton(
                  text: 'female',
                  icon: Icons.female,
                  bgColor: jinis == Jinis.ayal ? AppColors.greyBlueDarker : AppColors.greyBlueDark,
                  // bgColor: ayalTusunBer(),
                  onTap: () {
                    setState(() {
                      jinis = Jinis.ayal;
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
                    crossAxisAlignment: CrossAxisAlignment.baseline, // Align to baseline
                    textBaseline: TextBaseline.alphabetic, // Specify baseline type
                    children: [
                      Text(
                        boy.toInt().toString(),
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
                    value: boy,
                    min: 50,
                    max: 210,
                    thumbColor: AppColors.pinkDark,
                    activeColor: AppColors.pinkDark,
                    onChanged: (double ozgorgonSan) {
                      log('ozgorgonSan $ozgorgonSan');
                      boy = ozgorgonSan;
                      log('sliderdinSani $boy');

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
                    koboytTag: salmak.toString(),
                    azaytTag: 'salmak',
                    san: salmak.toString(),
                    aty: 'weigth',
                    koboyt: () {
                      setState(() {
                        salmak++;
                      });
                    },
                    azayt: () {
                      setState(() {
                        salmak--;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WeightAndAgeWidget(
                    koboytTag: jash.toString(),
                    azaytTag: 'jash',
                    san: jash.toString(),
                    aty: 'age',
                    koboyt: () {
                      setState(() {
                        jash++;
                      });
                    },
                    azayt: () {
                      setState(() {
                        jash--;
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
              return ResultScreen(
                salmak: salmak,
                boy: boy,
                jash: jash.toString(),
                jinis: jinis.name,
              );
            },
          ));
        },
        buttonText: 'calculate',
        // buttonTextStyle: TextStyle(fontSize: 42, color: Colors.white),
      ),
    );
  }

  Color erkekTusunBer() {
    if (jinis == Jinis.erkek) {
      return AppColors.greyBlueDarker;
    } else {
      return AppColors.greyBlueDark;
    }
  }

  Color ayalTusunBer() {
    if (jinis == Jinis.ayal) {
      return AppColors.greyBlueDarker;
    } else {
      return AppColors.greyBlueDark;
    }
  }
}

// refactor


