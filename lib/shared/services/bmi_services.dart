class BmiServices {
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
