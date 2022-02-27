import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/toast.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:erx/widgets/otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNo;
  const OtpScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _vId = '';
  String otp = '';

  Future _sendCode() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${widget.phoneNo}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) {
            if (value.user != null) {
              Navigator.of(context).pop();
              showTextToast("Login Successful!");
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          //TODO: Add toast
        }
        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        _vId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  @override
  void initState() {
    _sendCode();
    super.initState();
  }

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
                  "Enter your phone number",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    color: ColorPalette.honeyDew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OTPTextField(
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: ColorPalette.coolGrey,
                    enabledBorderColor: ColorPalette.coolGrey,
                    focusBorderColor: ColorPalette.malachiteGreen,
                  ),
                  fieldWidth: 45,
                  // margin: EdgeInsets.zero,
                  outlineBorderRadius: 14,
                  length: 6,
                  width: double.infinity,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    color: ColorPalette.honeyDew,
                    fontWeight: FontWeight.bold,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (value) {
                    otp = value;
                  },
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
                  onPressed: () async {
                    if (otp.length == 6) {
                      final PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: _vId,
                        smsCode: otp,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then(
                        (value) {
                          if (value.user != null) {
                            Navigator.of(context).pop();
                            showTextToast("Login Successful!");
                          }
                        },
                      );
                    }
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
