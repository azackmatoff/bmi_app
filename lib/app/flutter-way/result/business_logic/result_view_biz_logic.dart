import 'package:bmi_app/shared/services/bmi_services.dart';

class ResultViewBizLogic {
  double bmiResults = 0;
  String bmiCategory = '';
  String bmiDescription = '';

  final BmiServices _bmiServices = BmiServices();

  void onInit({required int weight, required double height}) {
    bmiResults = _bmiServices.calculateBMI(
      weight,
      height,
    );

    _assessBMICategory();
    _getBMIDescription();
  }

  void _assessBMICategory() {
    bmiCategory = _bmiServices.assessBMICategory(bmiResults);
  }

  void _getBMIDescription() {
    bmiDescription = _bmiServices.getBMIDescription(bmiResults);
  }
}
