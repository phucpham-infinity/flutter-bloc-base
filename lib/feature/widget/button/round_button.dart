import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/size.dart';
import '../../../core/theme/text_style.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final bool isCloseButton;
  final bool selected;
  final VoidCallback onTap;
  final void Function()? onRemove;
  final Color? color;

  const RoundButton({
    super.key,
    required this.text,
    this.height,
    this.color = Colors.white,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.isCloseButton = false,
    this.onRemove,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? Sz.i.s44,
        padding: padding ??
            EdgeInsets.symmetric(horizontal: Sz.i.s16, vertical: Sz.i.s12),
        decoration: BoxDecoration(
            color: selected ? color : color?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(borderRadius ?? Sz.i.s16)),
        child: Center(
          child: Row(
            children: [
              Text(
                text,
                style: textStyle ??
                    ptBodyLargeBold(context).copyWith(
                        fontSize: Sz.i.s14,
                        color: getColor(context).primaryNormal),
              ),
              ...[
                if (isCloseButton) const SpacingBox(w: 4),
                if (isCloseButton)
                  GestureDetector(
                    onTap: onRemove,
                    child: SvgPicture.asset(
                      AppIcons.closeSm,
                      width: Sz.i.s16,
                      height: Sz.i.s16,
                    ),
                  )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
