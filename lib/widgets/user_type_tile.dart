import 'package:flutter/material.dart';

class UserTypeTile extends StatelessWidget {
  const UserTypeTile({
    Key? key,
    required this.userType,
    required this.svgString,
    this.onTap,
  }) : super(key: key);
  final String userType;
  final String svgString;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.amber,
        height: 50,
        width: 50,
        child: Text(userType),
      ),
    );
  }
}
