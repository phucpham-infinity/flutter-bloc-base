import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';

class BuildQuestionCircleButton extends StatelessWidget {
  final void Function()? onTap;
  const BuildQuestionCircleButton({super.key, required this.onTap});

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
          height: Sz.i.s50,
          width: Sz.i.s50,
          child: Center(
            child: SvgPicture.asset(
              AppIcons.questionCircle,
              width: Sz.i.s24,
              height: Sz.i.s24,
            ),
          ),
        ),
      ),
    );
  }
}
