import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.charlestonGreen,
      body: Stack(
        children: const [
          BackgroundStripes(),
          Center(
            child: SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                color: ColorPalette.malachiteGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
