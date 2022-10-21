import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/login/edit_number.dart';

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
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const EditNumber())));
        }),
        child: Text('Let\'s Start', style: textdeco));
  }
}
