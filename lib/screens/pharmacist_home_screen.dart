import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/screens/prescription_screen.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/utils/toast.dart';
import 'package:erx/widgets/otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PharmacistHomeScreen extends StatelessWidget {
  PharmacistHomeScreen({Key? key}) : super(key: key);
  final _nameStream = FirebaseFirestore.instance
      .collection("pharmacist")
      .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
      .snapshots();

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      GestureDetector(
                        onTap: () {
                          Provider.of<SharedPreferences>(
                            context,
                            listen: false,
                          ).remove("userType");
                          FirebaseAuth.instance.signOut().then((value) {
                            showTextToast("Logout Success!");
                            Navigator.of(context).pop();
                          });
                        },
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: SvgPicture.string(SvgStrings.profile),
                        ),
                      ),
                    ],
                  ),
                ),
                // Greatings
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: _nameStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30, left: 25),
                        child: Text(
                          "Hello ${snapshot.data!.data()!['pharmacyName'] as String}!",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30, left: 25),
                        child: Text(
                          "Hello !",
                          style: GoogleFonts.nunito(
                            color: ColorPalette.honeyDew,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    }
                  },
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
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(34),
                            topRight: Radius.circular(34),
                          ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Retrieve Prescription",
                                  style: GoogleFonts.nunito(
                                    color: ColorPalette.malachiteGreen,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  "Enter Prescription ID",
                                  style: GoogleFonts.nunito(
                                    color: ColorPalette.honeyDew,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                  ),
                                  child: OTPTextField(
                                    fieldStyle: FieldStyle.box,
                                    otpFieldStyle: OtpFieldStyle(
                                      borderColor: ColorPalette.coolGrey,
                                      enabledBorderColor: ColorPalette.coolGrey,
                                      focusBorderColor:
                                          ColorPalette.malachiteGreen,
                                    ),
                                    fieldWidth: 45,
                                    outlineBorderRadius: 14,
                                    width: double.infinity,
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      color: ColorPalette.honeyDew,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    onCompleted: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 120,
                                ),
                                Center(
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    color: ColorPalette.malachiteGreen,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PrescriptionScreen(
                                            prescriptionId: "1234",
                                            hospitalName: "ABC hosp",
                                            doctorName: "xyz def",
                                            hospitalAddress:
                                                "Lane 1, lane 2, pincode",
                                            prescriptionDate: "25-03-2022",
                                            patientName: "Xyz Abc",
                                            diagnosis: "X test",
                                            knownHistory: "Diabetes, headache",
                                            patientAge: 25,
                                            patientBp: "120/80",
                                            patientHeight: "5.5",
                                            patientTemp: 37,
                                            patientWeight: 76,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Retrieve",
                                      style: GoogleFonts.nunito(
                                        fontSize: 25,
                                        color: ColorPalette.chineseBlack,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorPalette.charlestonGreen,
                            boxShadow: [
                              BoxShadow(
                                color: ColorPalette.coolGrey.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.string(SvgStrings.search),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  controller: _searchController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintText: "Search prescription",
                                    hintStyle: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: ColorPalette.coolGrey,
                                    ),
                                  ),
                                  style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    color: ColorPalette.honeyDew,
                                  ),
                                  cursorColor: ColorPalette.honeyDew,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
