import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';

class BlurImageContainer extends StatelessWidget {
  final String urlImage;
  final Widget child;

  const BlurImageContainer(
      {super.key, required this.urlImage, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12.5,
                sigmaY: 12.5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        getColor(context).linearGradientColor2.withOpacity(0.5),
                        getColor(context).linearGradientColor.withOpacity(0.5),
                      ],
                      stops: const [
                        0.0,
                        0.0002
                      ],
                      begin: const Alignment(0.0, 0.0),
                      end: const Alignment(-0.001, -1),
                      tileMode: TileMode.repeated),
                ),
                alignment: Alignment.center,
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
