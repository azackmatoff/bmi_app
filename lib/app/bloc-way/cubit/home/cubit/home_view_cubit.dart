import 'package:bmi_app/app/bloc-way/cubit/home/cubit/home_view_cubit_state.dart';
import 'package:bmi_app/shared/enums/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewCubit extends Cubit<HomeViewCubitState> {
  HomeViewCubit()
      : super(HomeViewCubitState(
          gender: Gender.notChosen,
          height: 160,
          weight: 50,
          age: 18,
        ));

  void onGenderSelected(Gender selectedGender) {
    emit(HomeViewCubitState(
      gender: selectedGender,
      height: state.height,
      weight: state.weight,
      age: state.age,
    ));
  }

  void onHeightChanged(double newHeight) {
    emit(HomeViewCubitState(
      height: newHeight,
      gender: state.gender,
      weight: state.weight,
      age: state.age,
    ));
  }

  void onWeightChanged({required bool isIncrement}) {
    isIncrement
        ? emit(HomeViewCubitState(
            weight: state.weight + 1,
            gender: state.gender,
            height: state.height,
            age: state.age,
          ))
        : emit(HomeViewCubitState(
            weight: state.weight - 1,
            gender: state.gender,
            height: state.height,
            age: state.age,
          ));
  }

  void onAgeChanged({required bool isIncrement}) {
    isIncrement
        ? emit(HomeViewCubitState(
            age: state.age + 1,
            gender: state.gender,
            height: state.height,
            weight: state.weight,
          ))
        : emit(HomeViewCubitState(
            age: state.age + 1,
            gender: state.gender,
            height: state.height,
            weight: state.weight,
          ));
  }

  void reset() {
    emit(HomeViewCubitState(
      gender: Gender.notChosen,
      height: 160,
      weight: 50,
      age: 18,
    ));
  }
}
