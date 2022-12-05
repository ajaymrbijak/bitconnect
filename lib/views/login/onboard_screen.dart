import 'package:flutter/material.dart';

import 'components/blur_image_scaffold.dart';
import 'components/lets_start.dart';
import 'components/logo.dart';
import 'components/terms_and_conditions.dart';

class OnBoardHelloScreen extends StatelessWidget {
  const OnBoardHelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurImageScaffold(
      imagePath: "images/bg.jpeg",
      body: [
        const Logo(height: 150.0, width: 150.0, radius: 50.0),
        Text(
          "BitLink",
          style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              decoration: TextDecoration.none,
              fontSize: 50),
        ),
        Column(
          children: [
            Text(
              "Mobile Messaging App ",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  decoration: TextDecoration.none,
                  fontSize: 20),
            ),
            Text(
              "Connect the world",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  decoration: TextDecoration.none,
                  fontSize: 20),
            )
          ],
        ),
        TermsAndConditions(
          onPressed: () {},
        ),
        const LetsStart(),
      ],
    );
  }
}
