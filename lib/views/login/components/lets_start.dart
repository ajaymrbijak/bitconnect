import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../edit_number.dart';

class LetsStart extends StatefulWidget {
  const LetsStart({Key? key}) : super(key: key);

  @override
  State<LetsStart> createState() => _LetsStartState();
}

class _LetsStartState extends State<LetsStart> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (() {
          Get.to(const EditNumber());
        }),
        child: Text('Let\'s Start -->',
            style: textdeco.copyWith(color: Colors.white)));
  }
}
