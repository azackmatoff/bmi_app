import 'package:bmi_app/app/bloc-way/cubit/result/cubit/result_view_cubit_state.dart';
import 'package:bmi_app/shared/services/bmi_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultViewCubit extends Cubit<ResultViewCubitState> {
  final BmiServices _bmiServices = BmiServices();

  ResultViewCubit()
      : super(
          ResultViewCubitState(
            bmiResults: 0,
            bmiCategory: '',
            bmiDescription: '',
          ),
        );

  void onInit({required int weight, required double height}) {
    final bmiResults = _bmiServices.calculateBMI(
      weight,
      height,
    );

    final bmiCategory = _assessBMICategory(bmiResults);
    final bmiDescription = _getBMIDescription(bmiResults);

    emit(
      ResultViewCubitState(
        bmiResults: bmiResults,
        bmiCategory: bmiCategory,
        bmiDescription: bmiDescription,
      ),
    );
  }

  String _assessBMICategory(double bmiResults) {
    return _bmiServices.assessBMICategory(bmiResults);
  }

  String _getBMIDescription(double bmiResults) {
    return _bmiServices.getBMIDescription(bmiResults);
  }
}
