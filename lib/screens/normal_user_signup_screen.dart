import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NormalUserSignupScreen extends StatelessWidget {
  NormalUserSignupScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: _nameController),
            ),
            MaterialButton(
              onPressed: () {
                final String _userType = Provider.of<SharedPreferences>(
                  context,
                  listen: false,
                ).getString("userType")!;

                final String _phoneNo =
                    FirebaseAuth.instance.currentUser!.phoneNumber!;
                  // FirebaseFirestore.instance.collection(_userType).
                FirebaseFirestore.instance
                    .collection(_userType)
                    .doc(_phoneNo)
                    .set(
                  {
                    "name": _nameController.text,
                    "phoneNo": _phoneNo,
                  },
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
