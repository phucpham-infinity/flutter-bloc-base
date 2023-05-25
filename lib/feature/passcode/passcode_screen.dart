import 'package:flutter/material.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/main/main_screen.dart';
import 'package:pine_app/feature/passcode/setting_biometric_screen.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/keyboard_number/keyboard_number.dart';
import 'package:pine_app/feature/widget/textfield/otp/build_otp.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/size.dart';
import '../../core/theme/text_style.dart';
import '../../generated/l10n.dart';
import '../widget/button/back_button.dart';
import '../widget/scaffold/base_gradient_scaffold.dart';

class PassCodeScreen extends StatefulWidget {
  final bool isLoginSettings;
  final bool isAuth;
  const PassCodeScreen({
    super.key,
    this.isLoginSettings = false,
    this.isAuth = false,
  });

  @override
  State<PassCodeScreen> createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _codeConfirmController = TextEditingController();
  int get length => _codeController.text.length;
  String get password => _codeController.text;
  int get lengthConfirm => _codeConfirmController.text.length;
  String get passwordConfirm => _codeConfirmController.text;
  int get lengthPasscode => 4;
  String defaultPassCode = '1234';

  bool get inCorrect => widget.isAuth
      ? password != defaultPassCode && length == 4
      : password != passwordConfirm &&
          length == lengthPasscode &&
          lengthConfirm == lengthPasscode;

  bool get correct =>
      password == passwordConfirm &&
      length == lengthPasscode &&
      lengthConfirm == lengthPasscode;

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
    _codeConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 14),
            !widget.isAuth
                ? Padding(
                    padding: EdgeInsets.only(left: Sz.i.s8),
                    child: BuildBackButton(
                      onBack: () {
                        if (widget.isLoginSettings) {
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        }
                      },
                    ),
                  )
                : SpacingBox(h: 50, w: 50),
            Expanded(
              child: _buildPasscode(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasscode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacingBox(h: 24),
              widget.isAuth
                  ? Text(
                      S.current.enterAPIN,
                      style: ptTitle4(context).copyWith(
                          fontSize: Sz.i.s24, color: getColor(context).white),
                    )
                  : Text(
                      S.current.createAPIN,
                      style: ptTitle4(context).copyWith(
                          fontSize: Sz.i.s24, color: getColor(context).white),
                    ),
              const SpacingBox(h: 16),
              Text(
                S.current.setUpA4DigitPIN,
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s17, color: getColor(context).white),
              ),
            ],
          ),
        ),
        const SpacingBox(h: 41),
        if (widget.isAuth)
          BuildOtp(controller: _codeController)
        else
          length != lengthPasscode
              ? BuildOtp(controller: _codeController)
              : BuildOtp(controller: _codeConfirmController),
        if (inCorrect) ...[
          const SpacingBox(h: 30),
          Center(
            child: Text(
              S.current.wrongPasscode,
              style: ptBodySemiBold(context).copyWith(
                  fontSize: Sz.i.s14, color: getColor(context).error300),
            ),
          ),
        ],
        const Spacer(),
        KeyboardNumber(
          onTapClear: _onTapClear,
          onTapNumber: _onTapNumber,
        ),
        const SpacingBox(h: 20),
        // if (correct) ...[
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
        //     child: AppExpandButton.primary(
        //       onTap: () {
        //         if (widget.isLoginSettings) {
        //           Navigator.of(context).pop();
        //         } else {
        //           navigateTo(const SettingBiometricScreen());
        //         }
        //       },
        //       forceUppercase: false,
        //       label: S.current.next,
        //       enabled: correct,
        //     ),
        //   ),
        //   const SpacingBox(h: 20),
        //   ]
      ],
    );
  }

  void _onTapNumber(int number) async {
    if (length < lengthPasscode) {
      _codeController.text = '${password}$number';
      oncChanged();
    } else {
      if (lengthConfirm < lengthPasscode) {
        _codeConfirmController.text = '${_codeConfirmController.text}$number';
        oncChanged();
      }
    }
    if (widget.isAuth) {
      if (password == defaultPassCode) {
        navigateTo(MainScreen(), clearStack: true);
      }
    } else {
      if (correct) {
        if (widget.isLoginSettings) {
          Navigator.of(context).pop();
        } else {
          navigateTo(const SettingBiometricScreen());
        }
      }
    }
  }

  void _onTapClear() {
    if (password.isNotEmpty && passwordConfirm.isEmpty) {
      _codeController.text = password.substring(0, length - 1);
      oncChanged();
    }
    if (passwordConfirm.isNotEmpty) {
      _codeConfirmController.text =
          passwordConfirm.substring(0, lengthConfirm - 1);
      oncChanged();
    }
  }

  void oncChanged() {
    if (mounted) {
      setState(() {});
    }
  }
}
