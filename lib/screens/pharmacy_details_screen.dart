import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  final String name;
  PharmacyDetailsScreen({Key? key, required this.name}) : super(key: key);
  final TextEditingController _pharmacyNameController = TextEditingController();
  final TextEditingController _pharmacyAddressController =
      TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
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
                  "Pharmacy Name",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ColorPalette.coolGrey,
                      width: 2,
                    ),
                  ),
                  height: 60,
                  //TODO: Do Validation
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _pharmacyNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: ColorPalette.honeyDew,
                    ),
                    cursorColor: ColorPalette.honeyDew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  "Address",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ColorPalette.coolGrey,
                      width: 2,
                    ),
                  ),
                  height: 100,
                  //TODO: Do Validation
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _pharmacyAddressController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: ColorPalette.honeyDew,
                    ),
                    cursorColor: ColorPalette.honeyDew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  "Pincode",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ColorPalette.coolGrey,
                      width: 2,
                    ),
                  ),
                  height: 60,
                  //TODO: Do Validation
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _pinCodeController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
                    // final String _phoneNo =
                    //     FirebaseAuth.instance.currentUser!.phoneNumber!;

                    // FirebaseFirestore.instance
                    //     .collection("doctor")
                    //     .doc(_phoneNo)
                    //     .set(
                    //   {
                    //     "name": name,
                    //     "phoneNo": _phoneNo,
                    //   },
                    // ).then((value) => Navigator.of(context).pop());
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
