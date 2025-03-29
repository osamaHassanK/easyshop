


import 'package:easyshop/utils/appcolors.dart';
import 'package:easyshop/utils/apptext.dart';
import 'package:easyshop/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: AppColors.splashScreenBackgroundColor,
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/shopping-bag.png",color: AppColors.splashScreenLogoColor,),
              10.0.height,
              AppText.custom("EASYSHOP",color: AppColors.splashScreenLogoText,size: 40.sp),
            ],
          ),
        ),
      ),
    );
  }
}
