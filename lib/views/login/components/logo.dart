import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.height, this.radius, this.width});
  final width;
  final height;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: const DecorationImage(
          image: AssetImage("images/whatsapp.png"),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
