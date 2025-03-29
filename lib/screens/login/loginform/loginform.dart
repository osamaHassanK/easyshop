import 'package:easyshop/utils/spacing.dart';
import 'package:easyshop/widgets/customtextformfield/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/login_provider/login_form/form_provider.dart';
import '../../../providers/login_provider/login_form/get_form_error.dart';
import '../../../utils/apptext.dart';
import '../../../widgets/sign_in_with_google/sign_in_with_google.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final isShowPass = ref.watch(isShowPassProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              AppText.mediumSemiBold("Enter your Email"),
              10.height,
              CustomTextFormField(
                  hintText: "Email",
                  showPass: (){
                    isShowPass!=isShowPass;
                  },
                  isShowIcon: false,
                onChanged: (value){
                    ref.read(emailProvider.notifier).state = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              5.height,
              AppText.mediumSemiBold("Enter your Password"),
              10.height,
             CustomTextFormField(
                 hintText: "Password",
                 isPassword: !isShowPass, // ✅ Toggle obscure text
                 showPass: (){
                   ref.read(isShowPassProvider.notifier).state = !isShowPass; // ✅ toggle logic
                 },
                 isShowIcon: true),
              20.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                       minimumSize: Size(100.w, 50.h),
                      backgroundColor: Colors.teal, // 🔹 Button background color
                      foregroundColor: Colors.white, // 🔹 Text & icon color
                      elevation: 4, // 🔹 Shadow effect
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20), // 🔹 Button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // 🔹 Rounded corners
                      ),
                    ),
                    onPressed: () {
                      String errorMessage = getFormErrors(email, password);

                      if (errorMessage.isEmpty) {
                        print("✅ Login Successful: Email - $email, Password - $password");
                      } else {
                        // ❌ Show Snack bar with specific error messages
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: AppText.custom("Login",color: Colors.white,size: 18.sp),
                  ),
                ],
              ),
              20.height,
              signInWithGoogleButton(context,(){}),
            ],
          ),
        ),
      ),
    );
  }
}