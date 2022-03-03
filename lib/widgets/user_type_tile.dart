import 'package:erx/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTypeTile extends StatelessWidget {
  const UserTypeTile({
    Key? key,
    required this.userType,
    required this.svgString,
    required this.isSelected,
  }) : super(key: key);
  final String userType;
  final String svgString;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? ColorPalette.malachiteGreen : Colors.transparent,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      height: 168,
      width: 138,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.string(
            svgString,
            height: 70,
          ),
          Text(
            userType,
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: ColorPalette.honeyDew,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
