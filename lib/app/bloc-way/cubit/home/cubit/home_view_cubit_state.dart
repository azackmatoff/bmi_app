import 'package:bmi_app/shared/enums/app_enums.dart';

class HomeViewCubitState {
  final Gender gender;
  final double height;
  final int weight;
  final int age;

  HomeViewCubitState({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
}
