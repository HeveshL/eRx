import 'package:erx/handlers/auth_handler.dart';
import 'package:erx/models/onboard_page_model.dart';
import 'package:erx/screens/onboarding_screen.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1100),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FirebaseAuth.instance.currentUser == null
                ? OnBoardingScreen(
                    pages: [
                      OnBoardPageModel(
                        svgString: SvgStrings.logoE,
                        title:
                            "Contactless and Convenient way of Managing all your Prescriptions at one place.",
                      ),
                      OnBoardPageModel(
                        svgString: SvgStrings.logoE,
                        title:
                            "Contactless and Convenient way of Managing all your Prescriptions at one place.",
                      ),
                      OnBoardPageModel(
                        svgString: SvgStrings.logoE,
                        title:
                            "Who doesn't love trees?! Go digital and take another step towards saving the planet.",
                      ),
                    ],
                    onComplete: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return AuthHandler();
                          },
                        ),
                      );
                    },
                  )
                : AuthHandler(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Hero(
                      tag: "e",
                      child: Transform.rotate(
                        angle: 8 * 22 / 7 / 180,
                        child: SvgPicture.string(
                          SvgStrings.logoE,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: "pres",
                  child: Visibility(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        "prescription",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Hero(
              tag: "sub",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "India's first ever e-prescription service",
                  style: GoogleFonts.nunito(
                    color: ColorPalette.honeyDew,
                    fontSize: 16,
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
