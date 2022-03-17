import 'dart:ui';

import 'package:erx/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: ColorPalette.coolGrey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: ColorPalette.coolGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: GoogleFonts.nunito(
                        color: Colors.transparent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 18,
                  ),
                  color: const Color.fromARGB(255, 15, 18, 24).withOpacity(0.8),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.transparent,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        text,
                        style: GoogleFonts.nunito(
                          color: Colors.transparent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: ColorPalette.coolGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: GoogleFonts.nunito(
                        color: ColorPalette.coolGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
