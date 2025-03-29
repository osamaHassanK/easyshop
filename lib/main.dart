import 'package:easyshop/routes/app_router.dart';
import 'package:easyshop/screens/login/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const EasyShopMobileApplication()));
}

class EasyShopMobileApplication extends StatelessWidget {
  const EasyShopMobileApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
       return MaterialApp(
         theme: ThemeData(
           textSelectionTheme: TextSelectionThemeData(
             cursorColor: Colors.teal, // Cursor color
             selectionColor: Colors.teal, // Text selection highlight
             selectionHandleColor: Colors.teal, // The round drop-like handle color
           ),
         ),
         home: LoginScreen(),
       );
       //  return MaterialApp.router(
       //    routerConfig: AppRouter.
       //    router,
       //  );
      },
    );
  }
}
