import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/enums/app_enums.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:bmi_app/widgets/custom_button.dart';
import 'package:bmi_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tandaldi = 0;

  /// tandaldi == 0 => Jinis tandalgan jok
  /// tandaldi == 1 => Erkek
  /// tandaldi == 2 => Ayal

  Jinis jinis = Jinis.tandalganJok;

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
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ResultScreen();
          }));
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


