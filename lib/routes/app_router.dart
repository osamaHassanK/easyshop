import 'package:easyshop/screens/cart/cart.dart';
import 'package:easyshop/screens/profile/profile.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home.dart';
import '../screens/main_screen/main_screen.dart';

class AppRouter{

  static final GoRouter router = GoRouter(
      initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context,state,child){
          return MainScreen(child: child);
        },
          routes: [
            GoRoute(path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(child: Home()),
            ),
            GoRoute(path: '/cart',
            builder: (context,state) => CartScreen(),
            ),
            GoRoute(path: '/profile',builder: (context,state)=> ProfileScreen())
          ]
      ),
    ],
  );

}