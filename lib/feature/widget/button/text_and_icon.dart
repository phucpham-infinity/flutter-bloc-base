import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/app_button.dart';

class BuildTextAndIconButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  const BuildTextAndIconButton(
      {super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      onTap: onTap,
      label: Text(
        label,
        style: ptBodyLargeBold(context)
            .copyWith(fontSize: Sz.i.s16, color: getColor(context).black),
      ),
      radius: Sz.i.s20,
      enabled: true,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(getColor(context).white.withOpacity(0.7)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sz.i.s20),
          ),
        ),
      ),
      heightItem: Sz.i.s72,
      iconPosition: AppIconButtonPosition.end,
      expand: true,
      padIconSymmetrically: false,
      wIcon: SvgPicture.asset(AppIcons.uncheck),
      padding: EdgeInsets.all(Sz.i.s24),
    );
  }
}
