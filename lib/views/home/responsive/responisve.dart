import 'package:bitchat/views/home/responsive/desktop_body.dart';
import 'package:bitchat/views/home/responsive/mobile_body.dart';
import 'package:flutter/material.dart';

import 'responsive_model.dart';

class ResponiveScreen extends StatefulWidget {
  const ResponiveScreen({super.key});

  @override
  State<ResponiveScreen> createState() => _ResponiveScreenState();
}

class _ResponiveScreenState extends State<ResponiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveModel(
        mobileBody: MobileView(),
        desktopBody: DesktopView(),
      ),
    );
  }
}
