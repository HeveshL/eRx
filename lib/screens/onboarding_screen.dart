import 'package:erx/models/onboard_page_model.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  final VoidCallback? onComplete;
  final List<OnBoardPageModel> pages;
  const OnBoardingScreen({Key? key, this.onComplete, required this.pages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.charlestonGreen,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              children: [
                for (int i = 0; i < pages.length; i++)
                  OnBoardPage(data: pages[i], index: i)
              ],
            ),
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: onComplete,
                child: Text(
                  "Skip",
                  style: GoogleFonts.nunito(
                    color: ColorPalette.honeyDew,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
