import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/feature/app.dart';

class BuildBackButton extends StatelessWidget {
  final String? iconBackButton;
  final double? widthIcon;

  final VoidCallback? onBack;
  const BuildBackButton(
      {super.key, this.onBack, this.iconBackButton, this.widthIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onBack != null ? onBack!.call() : Get.back(),
        enableFeedback: true,
        borderRadius: BorderRadius.circular(50),
        highlightColor: Colors.white.withOpacity(0.1),
        child: SizedBox(
          height: Sz.i.s50,
          width: Sz.i.s50,
          child: Center(
            child: SvgPicture.asset(
              iconBackButton ?? AppIcons.arrowLeft,
              width: widthIcon ?? Sz.i.s16,
              height: widthIcon ?? Sz.i.s16,
            ),
          ),
        ),
      ),
    );
  }
}
