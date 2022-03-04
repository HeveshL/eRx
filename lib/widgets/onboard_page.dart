import 'package:erx/models/onboard_page_model.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    Key? key,
    required this.data,
    this.onButtonClick,
    required this.index,
  }) : super(key: key);
  final OnBoardPageModel data;
  final VoidCallback? onButtonClick;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: SvgPicture.string(data.svgString),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  data.title,
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    color: ColorPalette.honeyDew,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
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
                      color: i == index
                          ? ColorPalette.malachiteGreen
                          : ColorPalette.honeyDew,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
