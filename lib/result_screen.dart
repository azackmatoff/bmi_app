import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:bmi_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(title: 're-calculate'),
      body: const Center(
        child: Text('Result page'),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {},
        buttonText: 're-calculate',
      ),
    );
  }
}
