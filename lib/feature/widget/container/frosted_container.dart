import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';

class FrostedContainer extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final EdgeInsets? padding;
  final String? urlBg;
  final Color? bgColor;
  final List<BoxShadow>? boxShadow;
  final double? radius;
  final double? blur;
  final BoxBorder? border;
  const FrostedContainer({
    Key? key,
    this.onTap,
    this.radius,
    required this.child,
    this.padding,
    this.urlBg,
    this.bgColor,
    this.boxShadow,
    this.blur,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? Sz.i.s20),
          border: border,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    color: getColor(context).black.withOpacity(0.25),
                    offset: Offset(0, Sz.i.s4),
                    blurRadius: Sz.i.s79,
                    blurStyle: BlurStyle.normal),
              ],
          image: urlBg != null
              ? DecorationImage(
                  image: NetworkImage(urlBg ?? ''),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? Sz.i.s20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur ?? 4.0,
              sigmaY: blur ?? 4.0,
            ),
            child: Container(
              padding: padding ?? EdgeInsets.all(Sz.i.s16),
              decoration: BoxDecoration(
                color: bgColor ?? getColor(context).white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(radius ?? Sz.i.s20),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
