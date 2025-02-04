// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimandi/config/routes/routes.dart';
import 'package:minimandi/view/binding/binding.dart';
import 'package:minimandi/view/screens/launch/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (ctx) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        locale: Locale('en', 'US'),
        theme: ThemeData.light(),
        builder: DevicePreview.appBuilder,
        darkTheme: ThemeData.light(),
        initialRoute: AppLinks.splash,
        getPages: AppRoutes.pages,
        home: SplashScreen());
  }
}
