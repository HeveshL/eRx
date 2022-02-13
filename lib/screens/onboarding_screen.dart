import 'package:erx/models/onboard_page_model.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/onboard_page.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final VoidCallback? onComplete;
  final List<OnBoardPageModel> pages;
  const OnBoardingScreen({Key? key, this.onComplete, required this.pages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.charlestonGreen,
      body: PageView(
        children: [
          for (int i = 0; i < pages.length; i++)
            OnBoardPage(data: pages[i], index: i)
        ],
      ),
    );
  }
}
