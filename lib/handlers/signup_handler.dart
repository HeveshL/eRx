import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/screens/normal_user_signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpHandler extends StatelessWidget {
  const SignUpHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _userType = Provider.of<SharedPreferences>(
      context,
      listen: false,
    ).getString("userType")!;
    final String _phoneNo = FirebaseAuth.instance.currentUser!.phoneNumber!;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection(_userType).doc(_phoneNo).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.data() == null) {
            // Not yet signed-up

            return const NormalUserSignupScreen();
          } else {
            // Signed up
            return SizedBox();
          }
        } else {
          // Loading
          return const Scaffold(
            body: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(color: Colors.red),
              ),
            ),
          );
        }
      },
    );
  }
}
