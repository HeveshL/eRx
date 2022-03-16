import 'package:erx/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssistantHomeScreen extends StatelessWidget {
  const AssistantHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Assistant home screen"),
            IconButton(
              onPressed: () {
                Provider.of<SharedPreferences>(
                  context,
                  listen: false,
                ).remove("userType");
                FirebaseAuth.instance.signOut().then((value) {
                  showTextToast("Logout Success!");
                });
              },
              icon: const Icon(Icons.power_settings_new),
            ),
          ],
        ),
      ),
    );
  }
}
