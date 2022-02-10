import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
            Hero(
              tag: "pres",
              child: Visibility(
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
    );
  }
}
