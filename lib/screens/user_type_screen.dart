import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/svg_strings.dart';
import 'package:erx/widgets/background_stripes.dart';
import 'package:erx/widgets/user_type_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({Key? key, required this.onComplete}) : super(key: key);
  final VoidCallback onComplete;

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int _userType = 0;
  final List<String> _userTypes = [
    'patient',
    'pharmacist',
    'doctor',
    'assistant'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.chineseBlack,
      body: Stack(
        children: [
          // const BackgroundStripes(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Center(
                  child: Text(
                    "You are a",
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      color: ColorPalette.honeyDew,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: UserTypeTile(
                        svgString: SvgStrings.patient,
                        userType: "Patient",
                        isSelected: _userType == 0,
                      ),
                      onTap: () {
                        setState(() {
                          _userType = 0;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _userType = 1;
                        });
                      },
                      child: UserTypeTile(
                        svgString: SvgStrings.pharmacist,
                        userType: "Pharmacist",
                        isSelected: _userType == 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _userType = 2;
                        });
                      },
                      child: UserTypeTile(
                        svgString: SvgStrings.doctor,
                        userType: "Doctor",
                        isSelected: _userType == 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _userType = 3;
                        });
                      },
                      child: UserTypeTile(
                        svgString: SvgStrings.assistant,
                        userType: "Assistant",
                        isSelected: _userType == 3,
                      ),
                    ),
                  ],
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
                      Provider.of<SharedPreferences>(
                        context,
                        listen: false,
                      ).setString("userType", _userTypes[_userType]);
                      widget.onComplete();
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
          ),
        ],
      ),
    );
  }
}
