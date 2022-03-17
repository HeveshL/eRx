import 'package:erx/screens/splash_screen_2.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key, required this.playAnimation})
      : super(key: key);
  final bool playAnimation;

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    if (widget.playAnimation) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, a1, a2) => const SplashScreen2(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: "e",
              child: Transform.rotate(
                angle: 8 * 22 / 7 / 180,
                child: SvgPicture.string(
                  SvgStrings.logoE,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: MediaQuery.of(context).size.width / 2,
            child: Hero(
              tag: "pres",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "prescription",
                  style: GoogleFonts.nunito(
                    color: ColorPalette.honeyDew.withOpacity(0),
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
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
