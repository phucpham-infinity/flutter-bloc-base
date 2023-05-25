import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/app_button.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/loading_area.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/formatter/number_formatter.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_code_field.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/feature/widget/timer/app_counter_text.dart';
import 'package:pine_app/generated/l10n.dart';

class EnterTheCodeScreen extends StatefulWidget {
  final VoidCallback onNext;

  const EnterTheCodeScreen({
    super.key,
    required this.onNext,
  });

  @override
  State<EnterTheCodeScreen> createState() => _EnterTheCodeScreenState();
}

class _EnterTheCodeScreenState extends State<EnterTheCodeScreen> {
  final TextEditingController _numberPhoneController = TextEditingController();
  bool enableButton = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: LoadingArea(
          isLoading: _isLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Sz.i.s8),
                child: const BuildBackButton(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpacingBox(h: 12),
                      BuildTitleWithSub(
                          title: S.current.otpVerificatione,
                          sub: S.current.toConfirmTheNumber),
                      Text(
                        '+ 7 987 654-32-10',
                        style: ptBodyLargeThin(context).copyWith(
                            color: getColor(context).white,
                            fontSize: Sz.i.s17,
                            height: 1.41),
                      ),
                      const SpacingBox(h: 34),
                      AppCodeField(
                        enabled: true,
                        autofocus: true,
                        onChange: (value) {
                          setState(() {
                            enableButton = value.length == 4;
                          });
                        },
                      ),
                      SpacingBox(h: 8),
                      AppCounterText(
                        seconds: 60,
                        onResend: () {},
                      ),
                      const Spacer(),
                      AppExpandButton.primary(
                          forceUppercase: false,
                          onTap: () {
                            setState(() {
                              _isLoading = true;
                            });
                            Timer(const Duration(seconds: 2), () {
                              setState(() {
                                _isLoading = false;
                                widget.onNext.call();
                              });
                            });
                          },
                          label: S.current.confirm,
                          enabled: enableButton),
                      const SpacingBox(h: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPhoneField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: Sz.i.s56,
            child: AppExpandButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  getColor(context).white.withOpacity(0.7),
                ),
              ),
              onTap: () {},
              label: Text(
                '+971',
                style: ptBodyLargeThin(context).copyWith(
                  color: getColor(context).textActive,
                  fontSize: Sz.i.s15,
                ),
              ),
              wIcon: Image.asset(
                Images.uaeFlag,
                width: Sz.i.s20,
                height: Sz.i.s20,
              ),
              iconPosition: AppIconButtonPosition.start,
            ),
          ),
        ),
        const SpacingBox(w: 16),
        Expanded(
          flex: 7,
          child: SizedBox(
            child: AppRoundTextField(
              controller: _numberPhoneController,
              hintText: S.current.enterPhoneNumber,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.none,
              onChanged: (value) => setState(() {
                if (value.length > 8) {
                  enableButton = true;
                } else {
                  enableButton = false;
                }
              }),
              validation: (value) {
                return '';
              },
              inputFormatter: [
                NumberPhoneFormatter(
                  mask: 'x xxxxxxx',
                  separator: ' ',
                ),
              ],
              backgroundColor: getColor(context).white.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
