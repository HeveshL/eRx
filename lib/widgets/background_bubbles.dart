import 'dart:ui';

import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundBubbles extends StatelessWidget {
  const BackgroundBubbles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -63,
          bottom: 35,
          child: SvgPicture.string(SvgStrings.leftBlob),
        ),
        Positioned(
          right: -34,
          top: 100,
          child: SvgPicture.string(SvgStrings.rightBlob),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: Container(
            color: ColorPalette.charlestonGreen.withOpacity(0.3),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 15, 18, 24).withOpacity(0.7),
        ),
      ],
    );
  }
}
