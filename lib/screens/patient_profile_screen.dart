import 'dart:ui';

import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/widgets/glass_button.dart';
import 'package:erx/widgets/profile_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({Key? key, required this.onSignoutAction})
      : super(key: key);
  final VoidCallback onSignoutAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.chineseBlack,
      body: SafeArea(
        child: Stack(
          children: [
            // Background layers
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
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 80,
              top: 93,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorPalette.malachiteGreen.withOpacity(0.9),
                ),
              ),
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
            // Content
            Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 25,
                ),
                Text(
                  "Profile",
                  style: GoogleFonts.nunito(
                    color: ColorPalette.honeyDew,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.string(SvgStrings.profileBig),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "My name",
                      style: GoogleFonts.nunito(
                        color: ColorPalette.honeyDew,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: ColorPalette.honeyDew,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Profile actions
                ProfileActionButton(
                  icon: Icons.lock_outline_rounded,
                  label: "Privacy & Settings",
                  onTap: () {},
                ),
                ProfileActionButton(
                  icon: Icons.notifications_none_rounded,
                  label: "Notifications",
                  onTap: () {},
                ),
                ProfileActionButton(
                  icon: Icons.access_time,
                  label: "Medical History",
                  onTap: () {},
                ),
                ProfileActionButton(
                  icon: Icons.accessibility_new_rounded,
                  label: "Accessibility Options",
                  onTap: () {},
                ),
              ],
            ),
            // Sign out button
            Positioned(
              left: 34,
              bottom: 72,
              child: GlassButton(
                icon: Icons.exit_to_app_rounded,
                text: "Sign Out",
                onTap: onSignoutAction,
              ),
            ),
            // Close button
            Positioned(
              left: 15,
              top: 15,
              child: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: ColorPalette.honeyDew,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
