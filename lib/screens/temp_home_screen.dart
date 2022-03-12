import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/widgets/prescription_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempHomeScreen extends StatelessWidget {
  const TempHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.charlestonGreen,
      body: Stack(
        children: [
          SvgPicture.string(
            SvgStrings.homeScreenBackground,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Extra padding
                const SizedBox(
                  height: 20,
                ),
                // Top logo/menu/profile
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // menu
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.string(SvgStrings.hamburger),
                        ),
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
                      // Profile
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: SvgPicture.string(SvgStrings.profile),
                      ),
                    ],
                  ),
                ),
                // Greatings
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Text(
                    "Hello John!",
                    style: GoogleFonts.nunito(
                      color: ColorPalette.honeyDew,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 25),
                  child: Text(
                    "Hope you have a great day!",
                    style: GoogleFonts.nunito(
                      color: ColorPalette.honeyDew,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Body
                Expanded(
                  child: Stack(
                    children: [
                      // Main content
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(34),
                              topRight: Radius.circular(34),
                            ),
                            color: ColorPalette.chineseBlack,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 50,
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                                PrescriptionCard(
                                  doctorName: "Dr. Sakhir Ahmed",
                                  hospitalName: "Orange City Hospital",
                                  prescriptionDate: "10-03-2022",
                                  followUpDate: "20-03-2022",
                                  patientName: "Mr. John Smith",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Search  box
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorPalette.charlestonGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Center(
          //   child: IconButton(
          //     icon: const Icon(Icons.power_settings_new_outlined),
          //     color: Colors.white,
          //     onPressed: () {
          //       Provider.of<SharedPreferences>(
          //         context,
          //         listen: false,
          //       ).remove("userType");
          //       FirebaseAuth.instance.signOut();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
