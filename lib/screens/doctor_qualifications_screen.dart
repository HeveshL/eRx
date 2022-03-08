import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorQualificationScreen extends StatelessWidget {
  final String name;
  DoctorQualificationScreen({Key? key, required this.name}) : super(key: key);

  final TextEditingController _qualificationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.charlestonGreen,
      body: Stack(
        children: [
          const BackgroundStripes(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 75,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  "Tell us your qualifications",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    color: ColorPalette.honeyDew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  //TODO: Do Validation
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _qualificationController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.honeyDew,
                          width: 2,
                        ),
                      ),
                    ),
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: ColorPalette.honeyDew,
                    ),
                    cursorColor: ColorPalette.honeyDew,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
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
                    final String _phoneNo =
                        FirebaseAuth.instance.currentUser!.phoneNumber!;

                    FirebaseFirestore.instance
                        .collection("doctor")
                        .doc(_phoneNo)
                        .set(
                      {
                        "name": name,
                        "qualifications": _qualificationController.text,
                        "phoneNo": _phoneNo,
                      },
                    ).then((value) => Navigator.of(context).pop());
                  },
                  child: Text(
                    "Next",
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      color: ColorPalette.chineseBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
