import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/size.dart';

class BuildIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  const BuildIconButton({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        enableFeedback: true,
        borderRadius: BorderRadius.circular(50),
        highlightColor: Colors.white.withOpacity(0.1),
        child: SizedBox(
          height: Sz.i.s40,
          width: Sz.i.s40,
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: Sz.i.s24,
              height: Sz.i.s24,
            ),
          ),
        ),
      ),
    );
  }
}
