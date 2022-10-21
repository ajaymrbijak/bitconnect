import 'package:bitchat/screens/login/hello.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

const bool USE_EMULATOR = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // if (USE_EMULATOR) {
  //   _connectFireBaseEmulator();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Hello(),
        routes: const {
          // 'phone': (context) => MyPhone(),
          // 'verify': (context) => MyVerify()
        },
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
            primaryColor: const Color(0xFF08C187)));
  }
}
