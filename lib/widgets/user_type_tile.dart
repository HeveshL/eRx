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
    return Container();
  }
}
