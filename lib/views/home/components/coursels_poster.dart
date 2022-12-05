import 'package:flutter/material.dart';

class PosterCardView extends StatelessWidget {
  const PosterCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      height: 180,
      // width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.red,
        ),
      ),
    );
  }
}
