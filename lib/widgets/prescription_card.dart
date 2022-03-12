import 'dart:ui';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _borderRadius = 20;

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    Key? key,
    required this.hospitalName,
    required this.doctorName,
    required this.patientName,
    required this.prescriptionDate,
    this.followUpDate,
  }) : super(key: key);
  final String hospitalName;
  final String doctorName;
  final String patientName;
  final String prescriptionDate;
  final String? followUpDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
        child: SizedBox(
          height: 115,
          width: double.infinity,
          child: Stack(
            children: [
              SvgPicture.string(
                SvgStrings.presCardBubbles,
                height: 115,
                fit: BoxFit.fitHeight,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: Container(
                  color: ColorPalette.charlestonGreen.withOpacity(0.3),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 15, 18, 24).withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
