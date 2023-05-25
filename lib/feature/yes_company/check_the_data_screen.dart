import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/form_validator_utils.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/feature/yes_company/enter_your_email_screen.dart';

import 'package:pine_app/generated/l10n.dart';

class CheckTheDataScreen extends StatefulWidget {
  const CheckTheDataScreen({super.key});

  @override
  State<CheckTheDataScreen> createState() => _CheckTheDataScreenState();
}

class _CheckTheDataScreenState extends State<CheckTheDataScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _licenseNoController = TextEditingController();
  final TextEditingController _registerNoController = TextEditingController();

  bool _isCompanyName = false;
  bool _licenseNo = false;
  bool _registerNo = false;

  bool get _enable => _isCompanyName && _licenseNo && _registerNo;

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                        title: S.current.checkTheDetail,
                        sub: S.current.reviewTheInformationAndSubmit,
                      ),
                    ),
                    const SpacingBox(h: 32),
                    Text(
                      S.current.companyLicense,
                      style: ptBodyLargeBold(context).copyWith(
                        fontSize: Sz.i.s20,
                        color: getColor(context).white,
                      ),
                    ),
                    const SpacingBox(h: 24),
                    _buildTextField(
                      context,
                      controller: _companyNameController,
                      label: S.current.companyName,
                      onChanged: (value) {
                        setState(() {
                          _isCompanyName =
                              FormValidator.notEmptyValidate(value);
                        });
                      },
                    ),
                    const SpacingBox(h: 16),
                    _buildTextField(
                      context,
                      controller: _licenseNoController,
                      label: S.current.licenseNo,
                      onChanged: (value) {
                        setState(() {
                          _licenseNo = FormValidator.notEmptyValidate(value);
                        });
                      },
                    ),
                    const SpacingBox(h: 16),
                    _buildTextField(
                      context,
                      controller: _registerNoController,
                      label: S.current.registerNo,
                      onChanged: (value) {
                        setState(() {
                          _registerNo = FormValidator.notEmptyValidate(value);
                        });
                      },
                    ),
                    SpacingBox(h: 179),
                    AppExpandButton.primary(
                      forceUppercase: false,
                      enabled: _enable,
                      onTap: () => navigateTo(const EnterYourEmailScreen()),
                      label: S.current.next,
                    ),
                    const SpacingBox(h: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    void Function(String)? onChanged,
  }) {
    return AppRoundTextField.label(
      borderRadius: BorderRadius.circular(Sz.i.s20),
      contentPadding:
          EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
      backgroundColor: getColor(context).white.withOpacity(0.7),
      controller: controller,
      label: label,
      enabled: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.none,
      validation: (value) {
        return '';
      },
      onChanged: onChanged,
    );
  }
}
