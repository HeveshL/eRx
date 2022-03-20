import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({Key? key, required this.prescriptionId})
      : super(key: key);
  final String prescriptionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorPalette.chineseBlack,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("prescription")
                  .doc(prescriptionId)
                  .snapshots(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(SvgStrings.logoE, height: 20),
                        Text(
                          "prescription",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      child: Text(
                        snapshot.data!.data()!['hospital'] as String,
                        style: GoogleFonts.nunito(
                          color: ColorPalette.malachiteGreen,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        "Dr. ${snapshot.data!.data()!['doctorName']}",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        "19, Khamla Road Veer Sawarkar Square, Tatya Tope Nagar, Nagpu,Maharashtra- 440015",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.honeyDew,
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Id: 5164",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.malachiteGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.calendar_today,
                            color: ColorPalette.honeyDew,
                            size: 15,
                          ),
                        ),
                        Text(
                          // ignore: avoid_dynamic_calls
                          snapshot.data!['dateTime']
                              .toDate()
                              .toString()
                              .split(" ")[0],
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 11,
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
                          fontSize: 18,
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
                          // ignore: avoid_dynamic_calls
                          "name: ${snapshot.data!["patient"]["name"] as String}",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "Age: ${snapshot.data!['patient']['age']} years",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
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
                                snapshot.data!["patient"]["generalInfo"]
                                    ["temperature"] as String,
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
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
                                snapshot.data!["patient"]["generalInfo"]
                                    ["weight"] as String,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
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
                                Icons.bloodtype,
                                color: ColorPalette.honeyDew,
                                size: 30,
                              ),
                              Text(
                                snapshot.data!["patient"]["generalInfo"]["bp"]
                                    as String,
                                style: GoogleFonts.nunito(
                                  color: ColorPalette.honeyDew,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
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
                                snapshot.data!["patient"]["generalInfo"]["bp"]
                                    as String,
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
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: Text(
                        "Known History",
                        style: GoogleFonts.nunito(
                          color: ColorPalette.malachiteGreen,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
