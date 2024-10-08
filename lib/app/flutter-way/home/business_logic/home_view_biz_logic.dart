import 'package:bmi_app/shared/enums/app_enums.dart';

class HomeViewBizLogic {
  Gender gender = Gender.notChosen;
  double height = 160;
  int weight = 50;
  int age = 18;

  void onGenderSelected(Gender selectedGender) {
    gender = selectedGender;
  }

  void onHeightChanged(double newHeight) {
    height = newHeight;
  }

  void onWeightChanged({required bool isIncrement}) {
    weight = isIncrement ? weight + 1 : weight - 1;
    // if (isIncrement) {
    //   weight++;
    // } else {
    //   weight--;
    // }
  }

  void onAgeChanged({required bool isIncrement}) {
    age = isIncrement ? age + 1 : age - 1;
  }

  void reset() {
    gender = Gender.notChosen;
    height = 160;
    weight = 50;
    age = 18;
  }
}
