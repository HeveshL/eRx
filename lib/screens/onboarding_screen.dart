import 'package:erx/models/onboard_page_model.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:erx/widgets/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  final VoidCallback? onComplete;
  final List<OnBoardPageModel> pages;
  const OnBoardingScreen({Key? key, this.onComplete, required this.pages})
      : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: Stack(
        children: [
          // const BackgroundStripes(),
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            controller: _pageController,
            children: [
              for (int i = 0; i < widget.pages.length; i++)
                OnBoardPage(data: widget.pages[i])
            ],
          ),
          Positioned(
            top: 30,
            right: 10,
            child: TextButton(
              onPressed: widget.onComplete,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: i == _currentPage
                                  ? ColorPalette.malachiteGreen
                                  : ColorPalette.honeyDew,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
