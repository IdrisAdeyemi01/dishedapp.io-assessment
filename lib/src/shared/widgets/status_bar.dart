import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
    required this.child,
    this.statusBarColor = AppColors.white,
    this.statusBarIconBrightness = Brightness.dark,
    this.systemNavigationBarIconBrightness = Brightness.dark,
    this.systemNavigationBarColor = AppColors.white,
  }):super(key: key);
  final Widget child;
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;
  final Brightness systemNavigationBarIconBrightness;
  final Color systemNavigationBarColor;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
      ),
      child: SafeArea(child: child),
    );
  }
}
