import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundStripes extends StatelessWidget {
  const BackgroundStripes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            right: -110,
            top: -110,
            child: SvgPicture.string(SvgStrings.stripes),
          ),
          Positioned(
            left: -110,
            bottom: -200,
            child: Transform.rotate(
              angle: 22 / 7,
              child: SvgPicture.string(SvgStrings.stripes),
            ),
          ),
        ],
      ),
    );
  }
}
