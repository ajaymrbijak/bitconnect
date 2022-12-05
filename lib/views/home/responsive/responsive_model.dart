import 'package:bitchat/constants/constants.dart';
import 'package:flutter/material.dart';

class ResponsiveModel extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveModel(
      {super.key, required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
