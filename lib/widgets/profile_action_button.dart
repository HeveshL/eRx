import 'dart:ui';

import 'package:erx/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 45,
              width: 45,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: ColorPalette.malachiteGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Container(
                      color: const Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ).withOpacity(0.15),
                    ),
                  ),
                  Icon(
                    icon,
                    color: ColorPalette.honeyDew,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: ColorPalette.honeyDew,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.navigate_next_rounded,
            color: ColorPalette.honeyDew,
            size: 30,
          ),
        ],
      ),
    );
  }
}
