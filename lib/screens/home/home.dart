import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/appcolors.dart';
import '../../utils/spacing.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Easy Shops",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          backgroundColor: AppColors.appBarColor,
          actions: [
            Image.asset("assets/icons/bell.png", scale: 5),
            10.0.width,
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: 15, // 5 rows * 3 columns = 15 items
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.shopping_bag, size: 40.sp, color: Colors.black54),
                    ),
                    SizedBox(height: 8.h),
                    Text("Product ${index + 1}",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                    Text("Rs. ${(index + 1) * 100}",
                        style: TextStyle(fontSize: 12.sp, color: Colors.green)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
