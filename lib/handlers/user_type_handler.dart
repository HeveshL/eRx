import 'package:erx/handlers/signup_handler.dart';
import 'package:erx/screens/user_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTypeHandler extends StatefulWidget {
  const UserTypeHandler({Key? key}) : super(key: key);

  @override
  State<UserTypeHandler> createState() => _UserTypeHandlerState();
}

class _UserTypeHandlerState extends State<UserTypeHandler> {
  @override
  Widget build(BuildContext context) {
    final String? _userType =
        context.watch<SharedPreferences>().getString("userType");
    if (_userType == null) {
      return UserTypeScreen(
        onComplete: () {
          setState(() {});
        },
      );
    } else {
      return const SignUpHandler();
    }
  }
}
