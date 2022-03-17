import 'package:erx/screens/splash_screen_3.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1100),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, a1, a2) => const SplashScreen3(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: Stack(
        children: [
          Center(
            child: Row(
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
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Hero(
                tag: "sub",
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    "India's first ever e-prescription service",
                    style: GoogleFonts.nunito(
                      color: ColorPalette.honeyDew.withOpacity(0),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
