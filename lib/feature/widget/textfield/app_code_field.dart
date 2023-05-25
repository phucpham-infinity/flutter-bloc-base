import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/textfield/custom_pin_code_text_field.dart'
    as custom_pin_code_text_field;
import '../../../core/theme/colors.dart';
import '../../../core/theme/size.dart';

class AppCodeField extends StatelessWidget {
  final Function(String)? onChange;
  final Function(String)? onComplete;
  final bool? enabled;
  final bool? autofocus;

  const AppCodeField({
    this.onChange,
    this.enabled,
    this.autofocus,
    this.onComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {},
      child: custom_pin_code_text_field.CustomPinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        autoFocus: autofocus ?? false,
        enabled: enabled ?? true,
        animationType: AnimationType.fade,
        obscuringCharacter: '-',
        obscuringWidget: Text(
          '-',
          style: ptBodyLargeThin(context).copyWith(
            color: const Color(0xff1E1C28),
            fontSize: Sz.i.s15,
          ),
        ),
        keyboardType: TextInputType.number,
        mainAxisAlignment: MainAxisAlignment.start,
        pinTheme: PinTheme(
            fieldHeight: Sz.i.s56,
            fieldWidth: Sz.i.s56,
            activeColor: AppColors.white.withOpacity(0.7),
            selectedColor: AppColors.white.withOpacity(0.7),
            selectedFillColor: AppColors.white.withOpacity(0.7),
            inactiveColor: AppColors.white.withOpacity(0.7),
            disabledColor: AppColors.white.withOpacity(0.7),
            activeFillColor: AppColors.white.withOpacity(0.7),
            inactiveFillColor: AppColors.white.withOpacity(0.7),
            borderWidth: 0,
            shape: PinCodeFieldShape.box,
            fieldOuterPadding: EdgeInsets.only(right: Sz.i.s16),
            borderRadius: BorderRadius.circular(Sz.i.s16)),
        textStyle: ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s15),
        backgroundColor: Colors.transparent,
        cursorColor: AppColors.textSecondDary,
        animationDuration: const Duration(milliseconds: 350),
        enableActiveFill: true,
        onCompleted: (value) {
          if (onComplete != null) onComplete!(value);
        },
        onChanged: (value) {
          if (onChange != null) onChange!(value);
        },
        beforeTextPaste: (String? text) =>
            text != null &&
            text.isNotEmpty &&
            text.trim().length == 6 &&
            RegExp(r'^[0-9]$').hasMatch(text),
      ),
    );
  }
}
