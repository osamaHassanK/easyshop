import 'package:easyshop/screens/login/signinform/get_signup_error/get_signup_error.dart';
import 'package:easyshop/utils/spacing.dart';
import 'package:easyshop/widgets/customtextformfield/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/signin_provider/signin_provider.dart';
import '../../../utils/apptext.dart';
import '../../../widgets/sign_in_with_google/sign_in_with_google.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(signInformKeyProvider);
    final firstName = ref.watch(firstNameProvider);
    final lastName = ref.watch(lastNameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final isShowPass = ref.watch(isShowPassProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              AppText.mediumSemiBold("First Name"),
              10.height,
              CustomTextFormField(
                hintText: "Enter your first name",
                isShowIcon: false,
                onChanged: (value) {
                  ref.read(firstNameProvider.notifier).state = value;
                },
                validator: (value) => value!.isEmpty ? "First name is required" : null,
                showPass: () {  },
              ),
              10.height,
              AppText.mediumSemiBold("Last Name"),
              10.height,
              CustomTextFormField(
                hintText: "Enter your last name",
                isShowIcon: false,
                onChanged: (value) {
                  ref.read(lastNameProvider.notifier).state = value;
                },
                validator: (value) => value!.isEmpty ? "Last name is required" : null, showPass: () {  },
              ),
              10.height,
              AppText.mediumSemiBold("Email"),
              10.height,
              CustomTextFormField(
                hintText: "Enter your email",
                isShowIcon: false,
                onChanged: (value) {
                  ref.read(emailProvider.notifier).state = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                }, showPass: () {  },
              ),
              10.height,
              AppText.mediumSemiBold("Password"),
              10.height,
              CustomTextFormField(
                hintText: "Enter your password",
                isPassword: !isShowPass,
                showPass: () {
                  ref.read(isShowPassProvider.notifier).state = !isShowPass;
                },
                isShowIcon: true,
                onChanged: (value) {
                  ref.read(passwordProvider.notifier).state = value;
                },
                validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
              ),
              20.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 50.h),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      String errorMessage = getSignUpErrors(firstName, lastName, email, password);

                      if (errorMessage.isEmpty) {
                        print("✅ Account Created: First Name - \$firstName, Last Name - \$lastName, Email - \$email, Password - \$password");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: AppText.custom("Sign Up", color: Colors.white, size: 18.sp),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
