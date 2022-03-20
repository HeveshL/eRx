import 'dart:ui';
import 'package:erx/screens/prescription_screen.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const double _borderRadius = 16;

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    Key? key,
    required this.hospitalName,
    this.doctorName,
    required this.patientName,
    required this.prescriptionDate,
    this.followUpDate,
    required this.prescriptionId,
  }) : super(key: key);
  final String hospitalName;
  final String prescriptionId;
  final String? doctorName;
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PrescriptionScreen(
                prescriptionId: prescriptionId,
              ),
            ),
          );
        },
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
                  color: const Color.fromARGB(255, 15, 18, 24).withOpacity(0.6),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Hospital name
                          Text(
                            hospitalName,
                            style: GoogleFonts.nunito(
                              color: ColorPalette.honeyDew,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Prescription Date
                          Row(
                            children: [
                              SvgPicture.string(SvgStrings.calendar),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                prescriptionDate,
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Doctor's name
                      Text(
                        doctorName ?? '',
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // patient name
                          Text(
                            patientName,
                            style: GoogleFonts.nunito(
                              color: ColorPalette.honeyDew,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Followup Date
                          Row(
                            children: [
                              SvgPicture.string(SvgStrings.followUp),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                followUpDate ?? '',
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.malachiteGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
