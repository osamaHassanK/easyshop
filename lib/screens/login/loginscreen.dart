import 'package:easyshop/providers/login_provider/login_form/form_provider.dart';
import 'package:easyshop/screens/login/signinform/signinform.dart';
import 'package:easyshop/utils/apptext.dart';
import 'package:easyshop/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/login_provider/toggle_provider.dart';
import 'loginform/loginform.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = ref.watch( tabIndexProvider); // Watch state
    final tabs = ["Login",
      //"Number",
      "SignIn"];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.height,
              AppText.largeBold("Welcome to EasyShop"),
              AppText.mediumSemiBold("Access your account"),
              30.height,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(tabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(tabIndexProvider.notifier).state = index; // Update state
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 90.h,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: selectedIndex == index ? Colors.teal : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: AppText.mediumSemiBold(
                          tabs[index],
                          color: selectedIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              20.height,
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    LoginForm(),
                   // PhoneNumberForm(),
                    SignUpForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class PhoneNumberForm extends StatelessWidget {
  const PhoneNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AppText.mediumSemiBold("Phone Number Form"));
  }
}

