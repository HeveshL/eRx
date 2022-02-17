import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.userType}) : super(key: key);
  final String userType;
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _phoneNoController),
            MaterialButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
