import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/phone_verification/enter_the_code_screen.dart';
import 'package:pine_app/feature/widget/button/app_button.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/formatter/number_formatter.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

import '../../core/base/local_storage.dart';
import '../passcode/passcode_screen.dart';

class EnterYourPhoneNumberScreen extends StatefulWidget {
  final bool isLoginSettings;
  const EnterYourPhoneNumberScreen({super.key, this.isLoginSettings = false});

  @override
  State<EnterYourPhoneNumberScreen> createState() =>
      _EnterYourPhoneNumberScreenState();
}

class _EnterYourPhoneNumberScreenState
    extends State<EnterYourPhoneNumberScreen> {
  final TextEditingController _numberPhoneController = TextEditingController();
  bool enableButton = false;
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
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
                        title: S.current.enterYourPhoneNumber,
                        sub: S.current.toLogInOrSignUp),
                    const SpacingBox(h: 34),
                    _buildNumberPhoneField(context),
                    const Spacer(),
                    Text(
                      S.current.byClickingNext,
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s14,
                          height: 1.7142,
                          color: getColor(context).white),
                    ),
                    const SpacingBox(h: 24),
                    AppExpandButton.primary(
                        onTap: () {
                          navigateTo(EnterTheCodeScreen(
                            onNext: () {
                              LocalStorage.instance
                                  .write(LocalStorage.KEY_TOKEN, 'token');
                              navigateTo(const PassCodeScreen());
                            },
                          ));
                        },
                        forceUppercase: false,
                        label: S.current.next,
                        enabled: enableButton),
                    const SpacingBox(h: 24),
                  ],
                ),
              ),
            ),
          ],
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
              textInputAction: TextInputAction.done,
              enabled: true,
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
