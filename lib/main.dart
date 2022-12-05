import 'package:bitchat/views/home/home_config_dashboard.dart';
import 'package:bitchat/views/home/respionsive_rates_check.dart';
import 'package:bitchat/views/login/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home/responsive/responisve.dart';

const bool USE_EMULATOR = true;
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnBoardHelloScreen(),
        routes: const {},
        theme: ThemeData(
            // visualDensity: VisualDensity.adaptivePlatformDensity,
            // brightness: Brightness.light,
            primarySwatch: Colors.deepPurple));
  }
}
