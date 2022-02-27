import 'package:erx/screens/otp_screen.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _phoneNoController = TextEditingController();

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
                height: 50,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  "Enter your phone number",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    color: ColorPalette.honeyDew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
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
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    controller: _phoneNoController,
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: ColorPalette.honeyDew,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "00000 00000",
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        color: const Color(0xff707070).withOpacity(0.2),
                      ),
                      prefixText: "+91 ",
                      prefixStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        color: ColorPalette.honeyDew.withOpacity(0.6),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return OtpScreen(phoneNo: _phoneNoController.text);
                        },
                      ),
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
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
