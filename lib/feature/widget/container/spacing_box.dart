import 'package:pine_app/core/theme/size.dart';
import 'package:flutter/material.dart';

class SpacingBox extends StatelessWidget {
  final double h;
  final double w;
  const SpacingBox({this.h = 0, this.w = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * Sz.i.s1,
      width: w * Sz.i.s1,
    );
  }
}
