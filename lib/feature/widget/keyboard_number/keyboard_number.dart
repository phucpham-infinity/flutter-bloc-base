import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/colors.dart';

import '../../../core/theme/icons/icons.dart';
import '../../../core/theme/size.dart';
import '../../../core/theme/text_style.dart';

class KeyboardNumber extends StatelessWidget {
  final ValueChanged<int>? onTapNumber;
  final Function()? onTapClear;

  const KeyboardNumber({
    Key? key,
    this.onTapNumber,
    this.onTapClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraint) {
      var size = constraint.maxHeight / 4;
      if (size > 90) {
        size = 90.0;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              3,
              (index) => _renderButton(
                context,
                value: '${index + 1}',
                size: size,
                onTap: () => onTapNumber?.call(index + 1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              3,
              (index) => _renderButton(
                context,
                value: '${index + 4}',
                size: size,
                onTap: () => onTapNumber?.call(index + 4),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              3,
              (index) => _renderButton(
                context,
                value: '${index + 7}',
                size: size,
                onTap: () => onTapNumber?.call(index + 7),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size, width: size),
              _renderButton(
                context,
                value: '0',
                size: size,
                onTap: () => onTapNumber?.call(0),
              ),
              _renderButton(
                context,
                icon: AppIcons.icClear,
                size: size,
                onTap: onTapClear,
              ),
            ],
          )
        ],
      );
    });
  }

  Widget _renderButton(
    BuildContext context, {
    String? value,
    String? icon,
    required double size,
    Function()? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        enableFeedback: true,
        borderRadius: BorderRadius.circular(50),
        highlightColor: Colors.white.withOpacity(0.1),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: (icon == null)
                ? Text(
                    value ?? '--',
                    style: ptBodySemiBold(context).copyWith(
                        fontSize: Sz.i.s40,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        height: 1.2),
                  )
                : SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
