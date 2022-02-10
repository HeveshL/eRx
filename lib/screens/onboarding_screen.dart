import 'package:erx/models/onboard_page_model.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final VoidCallback? onComplete;
  final List<OnBoardPageModel> pages;
  const OnBoardingScreen({Key? key, this.onComplete, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Center(),
        ),
      ),
    );
  }
}
