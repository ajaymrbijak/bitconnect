import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key, required this.onPressed});
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: 300,
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            "Terms & Conditions",
            style: TextStyle(color: Colors.black.withOpacity(0.9)),
          ),
        ),
      ),
    );
  }
}
