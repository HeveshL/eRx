import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempHomeScreen extends StatelessWidget {
  const TempHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.power_settings_new_outlined),
          onPressed: () {
            Provider.of<SharedPreferences>(context,listen: false).remove("userType");
            FirebaseAuth.instance.signOut();
          },
        ),
      ),
    );
  }
}
