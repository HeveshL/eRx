import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientSignupScreen extends StatelessWidget {
  PatientSignupScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

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
                  "Tell us your name",
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
                    controller: _nameController,
                    keyboardType: TextInputType.name,
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
                        .collection("patient")
                        .doc(_phoneNo)
                        .set(
                      {
                        "name": _nameController.text,
                        "phoneNo": _phoneNo,
                      },
                    );
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
