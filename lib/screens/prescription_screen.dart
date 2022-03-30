import 'dart:ui';

import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({
    Key? key,
    required this.prescriptionId,
    required this.hospitalName,
    required this.doctorName,
    required this.hospitalAddress,
    required this.prescriptionDate,
    required this.patientName,
    this.patientAge,
    this.patientTemp,
    this.patientWeight,
    this.patientBp,
    this.patientHeight,
    this.knownHistory,
    this.diagnosis,
  }) : super(key: key);
  final String prescriptionId;
  final String hospitalName;
  final String doctorName;
  final String hospitalAddress;
  final String prescriptionDate;
  final String patientName;
  final int? patientAge;
  final int? patientTemp;
  final int? patientWeight;
  final String? patientBp;
  final String? patientHeight;
  final String? knownHistory;
  final String? diagnosis;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 25,
                  ),
                  // logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Transform.rotate(
                            angle: 8 * 22 / 7 / 180,
                            child: SvgPicture.string(
                              SvgStrings.logoE,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "prescription",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Hospital details
                  Text(
                    hospitalName,
                    style: GoogleFonts.nunito(
                      color: ColorPalette.malachiteGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Dr. $doctorName",
                    style: GoogleFonts.nunito(
                      color: ColorPalette.honeyDew,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    hospitalAddress,
                    style: GoogleFonts.nunito(
                      color: ColorPalette.honeyDew,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Id: ",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.malachiteGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "1234",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.calendar_today,
                          color: ColorPalette.honeyDew,
                          size: 16,
                        ),
                      ),
                      Text(
                        prescriptionDate,
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: Text(
                      "Patients's Details",
                      style: GoogleFonts.nunito(
                        color: ColorPalette.malachiteGreen,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Name: $patientName",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Age: $patientAge years",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 60,
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.thermostat,
                                color: ColorPalette.honeyDew,
                                size: 30,
                              ),
                              Text(
                                patientTemp == null ? "-" : "$patientTemp",
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 60,
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.monitor_weight,
                                color: ColorPalette.honeyDew,
                                size: 30,
                              ),
                              Text(
                                patientWeight == null ? "-" : "$patientWeight",
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold, 
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 60,
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.bloodtype,
                                color: ColorPalette.honeyDew,
                                size: 30,
                              ),
                              Text(
                                patientBp == null ? "-" : "$patientBp",
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 60,
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.height,
                                color: ColorPalette.honeyDew,
                                size: 30,
                              ),
                              Text(
                                patientHeight == null ? "-" : "$patientHeight",
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: Text(
                      "Known History",
                      style: GoogleFonts.nunito(
                        color: ColorPalette.malachiteGreen,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
