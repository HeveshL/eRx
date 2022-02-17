import 'package:erx/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNo;
  const OtpScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _vId = '';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Enter OTP:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                      height: 20,
                    ),
                OTPTextField(
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Colors.white,
                    backgroundColor: Colors.white,
                    disabledBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    errorBorderColor: Colors.white,
                    focusBorderColor: Colors.white,
                  ),
                  fieldWidth: 40,
                  margin: EdgeInsets.zero,
                  outlineBorderRadius: 8,
                  length: 6,
                  width: double.infinity,
                  style: const TextStyle(fontSize: 14),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (value) async {
                    final PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: _vId,
                      smsCode: value,
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
