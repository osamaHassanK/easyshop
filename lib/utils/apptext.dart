import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  // Large Bold Text with Roboto font
  static Text largeBold(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto", // Using Roboto font
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  // Medium Semi-Bold Text with Roboto font
  static Text mediumSemiBold(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto", // Using Roboto font
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  // Small Normal Text with Roboto font
  static Text smallNormal(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto", // Using Roboto font
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }

  // Custom Text (Flexible with Roboto font)
  static Text custom(String text, {double size = 16, FontWeight weight = FontWeight.normal, Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto", // Using Roboto font
        fontSize: size.sp,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
