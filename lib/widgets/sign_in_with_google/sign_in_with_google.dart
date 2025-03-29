import 'package:easyshop/utils/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget signInWithGoogleButton(BuildContext context, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 56.h, // Adjusted using ScreenUtil
      width: 310.w, // Adjusted using ScreenUtil
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54), // Softer black tone
        borderRadius: BorderRadius.circular(16.r), // More modern rounded corners
        color: Colors.teal, // Ensures better visibility
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.r,
            offset: Offset(0, 2), // Adds depth
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/google.png',color: Colors.white,
            height: 28.h, // Adjusted using ScreenUtil
          ),
          SizedBox(width: 20.w),
          AppText.custom("Login With Google",color: Colors.white,size: 18.sp),// Adjusted using ScreenUtil
          // TextWidget(
          //   text: "Login with Google",
          //   fontSize: 16.sp, // Adjusted using ScreenUtil
          //   color: Colors.black87, // Slightly darker for readability
          //   fontWeight: FontWeight.w600,
          // ),
        ],
      ),
    ),
  );
}
