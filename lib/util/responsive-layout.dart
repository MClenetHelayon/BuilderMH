import 'package:builder_mhrs/tuto%20responsive/dimension.dart';
import 'package:flutter/material.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveLayout({super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}
