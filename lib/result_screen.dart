import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:bmi_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int salmak;
  final String jash;
  final double boy;
  final String jinis;
  const ResultScreen({
    super.key,
    required this.salmak,
    required this.jash,
    required this.boy,
    required this.jinis,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double bmiRezultati = 0;

  @override
  void initState() {
    bmiRezultati = calculateBMI(widget.salmak, widget.boy);
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
                    assessBMICategory(bmiRezultati),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.green,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    bmiRezultati.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    getBMIDescription(bmiRezultati),
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
        onTap: () {},
        buttonText: 're-calculate',
      ),
    );
  }

  /// Calculates BMI based on weight and height.
  ///
  /// [weight] is in kilograms.
  /// [height] is in centimeters.
  /// Returns the calculated BMI as a double.
  double calculateBMI(int weight, double height) {
    // Convert height from centimeters to meters
    double heightInMeters = height / 100;

    return weight / (heightInMeters * heightInMeters);
  }

  /// Assesses the BMI category based on the calculated BMI value.
  /// [bmi] is the calculated BMI value.
  /// Returns a string representing the BMI category.
  String assessBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  /// Provides a short description based on the calculated BMI value.
  /// [bmi] is the calculated BMI value.
  /// Returns a string containing a brief description of the BMI status.
  String getBMIDescription(double bmi) {
    if (bmi < 18.5) {
      return 'Your BMI indicates you are underweight. Consider consulting a healthcare professional for personalized guidance.';
    } else if (bmi < 25) {
      return 'Your BMI falls within the normal weight range. Keep up the healthy lifestyle!';
    } else if (bmi < 30) {
      return 'Your BMI indicates you are overweight. Consult a healthcare professional for advice on diet and exercise.';
    } else {
      return 'Your BMI indicates you are obese. It is important to seek guidance from a healthcare professional to address potential health risks.';
    }
  }
}
