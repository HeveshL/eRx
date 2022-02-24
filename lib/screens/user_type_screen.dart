import 'package:erx/utils/svg_strings.dart';
import 'package:erx/widgets/user_type_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key, required this.onComplete}) : super(key: key);
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("You are.."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserTypeTile(
                  svgString: SvgStrings.logoE,
                  userType: "Normal User",
                  onTap: () {},
                ),
                UserTypeTile(
                  svgString: SvgStrings.logoE,
                  userType: "Doctor",
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserTypeTile(
                  svgString: SvgStrings.logoE,
                  userType: "Chemist",
                  onTap: () {},
                ),
                UserTypeTile(
                  svgString: SvgStrings.logoE,
                  userType: "Assistant Staff",
                  onTap: () {},
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Provider.of<SharedPreferences>(context,listen: false)
                    .setString("userType", "normal-user");
                onComplete();
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
