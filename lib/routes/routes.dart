import 'package:flutter_application_1/views/screens/MyHomeScreen.dart';
import 'package:flutter_application_1/views/screens/main_screen.dart';
import 'package:get/get.dart';

import '../bindings/authBinding.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/signup_screen.dart';

class AppRoutes {
  // initial route
  static const loginscreen = Routes.loginscreen;
  static const myhomescreen = Routes.myhomescreen;
  static const mainscreen = Routes.mainscreen;

  // get page
  static final routes = [
    GetPage(
      name: Routes.loginscreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupscreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.myhomescreen,
      page: () => MyHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainscreen,
      page: () => const MyMainScreen(),
      binding: AuthBinding(),
    ),
  ];
}

// Create Class Routes To Add at routes List ::::::::::::
class Routes {
  static const loginscreen = '/loginscreen';
  static const signupscreen = '/signupscreen';
  static const myhomescreen = '/myhomescreen';
  static const mainscreen = '/mainscreen';
}
