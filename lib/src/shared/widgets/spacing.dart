// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {

  final double height;
  final double width;

  const Spacing.height(this.height) : width = 0;

  const Spacing.tinyHeight() : this.height(4);
  const Spacing.smallHeight() : this.height(8);
  const Spacing.mediumHeight() : this.height(16);
  const Spacing.bigHeight() : this.height(24);
  const Spacing.largeHeight() : this.height(32);

  const Spacing.width(this.width) : height = 0;

  const Spacing.tinyWidth() : this.width(4);
  const Spacing.smallWidth() : this.width(8);
  const Spacing.mediumWidth() : this.width(16);
  const Spacing.bigWidth() : this.width(24);
  const Spacing.largeWidth() : this.width(32);

  const Spacing.empty()
      : width = 0,
        height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
