import 'package:erx/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: Center(
        child: SizedBox(
          height: 35,
          width: 35,
          child: CircularProgressIndicator(
            color: ColorPalette.malachiteGreen,
          ),
        ),
      ),
    );
  }
}
