import 'package:bmi_app/app/bloc-way/cubit/result/cubit/result_view_cubit.dart';
import 'package:bmi_app/app/bloc-way/cubit/result/cubit/result_view_cubit_state.dart';
import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:bmi_app/shared/widgets/custom_app_bar.dart';
import 'package:bmi_app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitResultView extends StatefulWidget {
  final int weight;
  final double height;
  final Function() reset;
  const CubitResultView({
    super.key,
    required this.reset,
    required this.weight,
    required this.height,
  });

  @override
  State<CubitResultView> createState() => _CubitResultViewState();
}

class _CubitResultViewState extends State<CubitResultView> {
  final ResultViewCubit _cubit = ResultViewCubit();

  @override
  void initState() {
    _cubit.onInit(weight: widget.weight, height: widget.height);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultViewCubit, ResultViewCubitState>(
      bloc: _cubit,
      builder: (context, state) {
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
                        state.bmiCategory,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.yellow,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        state.bmiResults.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        state.bmiDescription,
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
            onTap: () {
              widget.reset.call();
              Navigator.pop(context);
            },
            buttonText: 're-calculate',
          ),
        );
      },
    );
  }
}
