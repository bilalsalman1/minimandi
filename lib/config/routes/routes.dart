// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:minimandi/view/screens/accepted/accepted_screen.dart';
import 'package:minimandi/view/screens/bottomnavigation/bottomnavigation_screen.dart';
import 'package:minimandi/view/screens/filter/filter.dart';
import 'package:minimandi/view/screens/location/location_screen.dart';
import 'package:minimandi/view/screens/login/login_screen.dart';
import 'package:minimandi/view/screens/number/number.dart';
import 'package:minimandi/view/screens/launch/onboarding_screen.dart';
import 'package:minimandi/view/screens/signin/signin_screen.dart';
import 'package:minimandi/view/screens/signup/signup_screen.dart';
import 'package:minimandi/view/screens/verification/verification_screen.dart';
import '../../view/screens/launch/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.onBoarding,
      page: () => OnboardingScreens(),
    ),
    GetPage(
      name: AppLinks.signIn,
      page: () => SigninScreen(),
    ),
    GetPage(
      name: AppLinks.number,
      page: () => NumberScreen(),
    ),
    GetPage(
      name: AppLinks.verification,
      page: () => VerificationScreen(),
    ),
    GetPage(
      name: AppLinks.location,
      page: () => LocationScreen(),
    ),
    GetPage(
      name: AppLinks.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppLinks.signUp,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: AppLinks.bottom,
      page: () => BottomNavigation(),
    ),
    GetPage(
      name: AppLinks.accepted,
      page: () => AcceptedScreen(),
    ),
    GetPage(
      name: AppLinks.filter,
      page: () => Filter(),
    ),
  ];
}

class AppLinks {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const signIn = '/signIn';
  static const number = '/number';
  static const verification = '/verification';
  static const location = '/location';
  static const login = '/login';
  static const signUp = '/signUp';
  static const bottom = '/bottom';
  static const accepted = '/accepted';
  static const filter = '/filter';
}
