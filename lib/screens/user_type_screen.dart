import 'package:erx/screens/login_screen.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/widgets/user_type_tile.dart';
import 'package:flutter/material.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen(userType: "Normal User",);
                        },
                      ),
                    );
                  },
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
          ],
        ),
      ),
    );
  }
}
