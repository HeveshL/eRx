import 'package:erx/screens/splash_screen_2.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, a1, a2) => const SplashScreen2(),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: ColorPalette.charlestonGreen,
      body: Center(
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
                    ),
                  ),
                ),
              ],
            ),
            Hero(
              tag: "pres",
              child: Visibility(
                visible: false,
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
      ),
    );
  }
}
