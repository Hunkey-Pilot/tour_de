import 'package:flutter/material.dart';

Widget buildSocialIcon({
  required IconData icon,
  required Color color,
  required VoidCallback onTap,
  Color iconColor = Colors.white,
  bool isGoogle = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: color,
      radius: 22,
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    ),
  );
}