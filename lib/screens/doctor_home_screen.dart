import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/screens/new_prescription_screen.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/utils/toast.dart';
import 'package:erx/widgets/prescription_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameStream = FirebaseFirestore.instance
        .collection("doctor")
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .snapshots();
    final _prescriptionStream = FirebaseFirestore.instance
        .collection("prescription")
        .where(
          "doctorID",
          isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber,
        )
        .snapshots();
    final _searchController = TextEditingController();

    final f = DateFormat('yyyy-MM-dd');

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
                      GestureDetector(
                        onTap: () {
                          Provider.of<SharedPreferences>(
                            context,
                            listen: false,
                          ).remove("userType");
                          FirebaseAuth.instance.signOut().then((value) {
                            showTextToast("Logout Success!");
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
                          "Hello Dr. ${(snapshot.data!.data()!['name'] as String).split(" ")[0]}!",
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
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),

                                // PrescriptionCard(
                                //   hospitalName: "Orange City Hospital",
                                //   prescriptionDate: "10-03-2022",
                                //   followUpDate: "20-03-2022",
                                //   patientName: "Mr. John Smith",
                                // ),
                                StreamBuilder<
                                        QuerySnapshot<Map<String, dynamic>>>(
                                    stream: _prescriptionStream,
                                    builder: (
                                      context,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snapshot,
                                    ) {
                                      if (snapshot.hasData) {
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return PrescriptionCard(
                                                hospitalName: snapshot
                                                        .data!.docs[index]
                                                        .data()['hospital']
                                                    as String,
                                                prescriptionDate: f.format(
                                                  (snapshot.data!.docs[index]
                                                                  .data()[
                                                              'dateTime']
                                                          as Timestamp)
                                                      .toDate(),
                                                ),
                                                followUpDate: snapshot
                                                        .data!.docs[index]
                                                        .data()['followUp']
                                                    as String?,
                                                patientName: (snapshot
                                                            .data!.docs[index]
                                                            .data()['patient']
                                                        as Map<String,
                                                            dynamic>)['name']
                                                    as String,
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return const Expanded(
                                          child: Center(
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CircularProgressIndicator(
                                                color:
                                                    ColorPalette.malachiteGreen,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },),
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
                                    hintText: "Search your prescription",
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const NewPrescriptionScreen();
                                  },
                                ),
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
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
