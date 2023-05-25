import 'package:flutter/material.dart';
import 'package:pine_app/core/model/card_detail.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/util/form_validator_utils.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/build_card_detail.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

import '../no_company/you_are_a_citizen_screen.dart';

class EnterYourEmailScreen extends StatefulWidget {
  const EnterYourEmailScreen({super.key});

  @override
  State<EnterYourEmailScreen> createState() => _EnterYourEmailScreenState();
}

class _EnterYourEmailScreenState extends State<EnterYourEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _enable = false;
  final List<CardDetail> _cardDetails = [
    CardDetail(
        title: S.current.verificationInProgress,
        description: S.current.takesUpTo1BusinessDay),
    CardDetail(title: S.current.pendingApproval),
    CardDetail(title: S.current.verificationComplete),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Sz.i.s8),
                  child: const BuildBackButton(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpacingBox(h: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
                        child: BuildTitleWithSub(
                          title: S.current.companyEmailAddress,
                          sub: S.current.submitYourCompanyEmailAddress,
                        ),
                      ),
                      const SpacingBox(h: 24),
                      AppRoundTextField.label(
                        enabled: true,
                        borderRadius: BorderRadius.circular(Sz.i.s20),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Sz.i.s24, vertical: Sz.i.s16),
                        backgroundColor:
                            getColor(context).white.withOpacity(0.7),
                        controller: _emailController,
                        label: S.current.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.none,
                        validation: (value) {
                          return '';
                        },
                        onChanged: (value) {
                          if (FormValidator.emailValidate(value)) {
                            setState(() {
                              _enable = true;
                            });
                          } else {
                            setState(() {
                              _enable = false;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s16, vertical: Sz.i.s24),
              child: AppExpandButton.primary(
                forceUppercase: false,
                enabled: _enable,
                onTap: _onCheck,
                label: S.current.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCheck() {
    showSheet(
      context,
      child: BuildCardDetail(
        title: S.current.verifyingCompanyDocuments,
        subtitle: S.current.afterWeVerifyYourDocuments,
        icon: AppIcons.clock,
        listCard: _cardDetails,
        noButton: true,
        onTap: () {
          navigateTo(YouAreACitizenScreen());
        },
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: AppExpandButton.primary(
            onTap: () {
              showFeatureUnderDevelopment(context);
            },
            forceUppercase: false,
            label: S.current.next,
            enabled: true,
          ),
        ),
      ),
    );
  }
}
