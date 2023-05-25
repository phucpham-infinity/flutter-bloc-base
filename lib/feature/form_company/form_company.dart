import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/form_validator_utils.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';

import 'package:pine_app/generated/l10n.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/images/images.dart';
import '../widget/container/bottom_space.dart';
import 'verify_email_screen.dart';

class FormCompanyScreen extends StatefulWidget {
  const FormCompanyScreen({super.key});

  @override
  State<FormCompanyScreen> createState() => _FormCompanyScreennState();
}

class _FormCompanyScreennState extends State<FormCompanyScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isCompanyName = false;
  String? _bussinessActivity;
  String? _legalType;
  bool _isError = false;
  bool get _enable =>
      _isCompanyName && _bussinessActivity != null && _legalType != null;

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpacingBox(h: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
                        child: BuildTitleWithSub(
                          title: S.current.submitCompanyDetails,
                          sub: S.current.requiredDetailsToIssueANewLicense,
                        ),
                      ),
                      const SpacingBox(h: 32),
                      if (_isError) ...[
                        Container(
                            width: context.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: Sz.i.s32, vertical: Sz.i.s16),
                            decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              S.current.companyAlreadyExists,
                              style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                color: getColor(context).black,
                              ),
                            )),
                        const SpacingBox(h: 16),
                      ],
                      Text(
                        S.current.generalInformation,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s20,
                          color: getColor(context).white,
                        ),
                      ),
                      const SpacingBox(h: 24),
                      GestureDetector(
                        //     onTap: () => _onChangeCompany(),
                        child: _buildTextField(context,
                            controller: _companyNameController,
                            enabled: false,
                            label: S.current.companyNameEnglish,
                            onChanged: (value) {
                          setState(() {
                            _isCompanyName =
                                FormValidator.notEmptyValidate(value);
                          });
                        }),
                      ),
                      if (_companyNameController.text.isNotEmpty) ...[
                        const SpacingBox(h: 4),
                        Text(
                          S.current.translatedIntoArabicAutomatically,
                          style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s14,
                              height: 1.7143,
                              color: getColor(context).white),
                        ),
                      ],
                      const SpacingBox(h: 16),
                      _buildOption(
                          onTap: () => _onChooseType(
                                onChanged: (data) {
                                  _bussinessActivity = data;
                                  setState(() {});
                                },
                              ),
                          hintText: S.current.businessActivity,
                          value: _bussinessActivity ?? ''),
                      const SpacingBox(h: 16),
                      _buildOption(
                          onTap: () => _onChooseType(
                                onChanged: (data) {
                                  _legalType = data;
                                  setState(() {});
                                },
                              ),
                          hintText: S.current.legalType,
                          value: _legalType ?? ''),
                      const SpacingBox(h: 48),
                      Text(
                        S.current.employeeInformation,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s20,
                          color: getColor(context).white,
                        ),
                      ),
                      const SpacingBox(h: 24),
                      _buildTextField(context,
                          controller: _employeeController,
                          keyboardType: TextInputType.number,
                          label: S.current.numberOfRmployees,
                          onChanged: (value) {
                        setState(() {
                          _isCompanyName =
                              FormValidator.notEmptyValidate(value);
                        });
                      }),
                      const SpacingBox(h: 48),
                      Text(
                        S.current.email,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s20,
                          color: getColor(context).white,
                        ),
                      ),
                      const SpacingBox(h: 8),
                      Text(
                        S.current
                            .allCompanyNewslettersReportsAndMessagesWillBeSent,
                        style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s14,
                          height: 1.7143,
                          color: getColor(context).white,
                        ),
                      ),
                      const SpacingBox(h: 24),
                      // _emailController.text != ''
                      //     ? GestureDetector(
                      //         onTap: () => _onChange(
                      //           onChanged: (value) {
                      //             setState(() {
                      //               _isValidEmail =
                      //                   FormValidator.emailValidate(value);
                      //             });
                      //           },
                      //           title: S.current.email,
                      //           controller: _emailController,
                      //           keyboardType: TextInputType.emailAddress,
                      //         ),
                      //         child: _buildTextField(
                      //           context,
                      //           controller: _emailController,
                      //           keyboardType: TextInputType.emailAddress,
                      //           enabled: false,
                      //           label: S.current.email,
                      //         ),
                      //       )
                      //     : _buildOption(
                      //         value: '',
                      //         hintText: S.current.email,
                      //         onTap: () => _onChange(
                      //               onChanged: (value) {
                      //                 setState(() {
                      //                   _isValidEmail =
                      //                       FormValidator.emailValidate(value);
                      //                 });
                      //               },
                      //               title: S.current.email,
                      //               controller: _emailController,
                      //               keyboardType: TextInputType.emailAddress,
                      //             ),
                      //         haveIcon: false),
                      const SpacingBox(h: 111),
                      AppExpandButton.primary(
                        forceUppercase: false,
                        enabled: _enable,
                        onTap: () async {
                          final result = await navigateTo(VerifyEmailScreen(
                            email: _emailController.text,
                          ));
                          if (result == null) {
                            _isError == true;
                            setState(() {});
                          }
                        },
                        label: S.current.next,
                      ),
                      const SpacingBox(h: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String value,
    required String hintText,
    required VoidCallback onTap,
    bool haveIcon = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s32, vertical: Sz.i.s16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getColor(context).white.withOpacity(0.7),
        ),
        child: Row(
          children: [
            value.isEmpty
                ? Text(
                    hintText,
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s15,
                        color: getColor(context).textActive),
                  )
                : Text(
                    value,
                    style:
                        ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s15),
                  ),
            const Spacer(),
            haveIcon
                ? SvgPicture.asset(
                    AppIcons.icArrowRight,
                    width: Sz.i.s24,
                    height: Sz.i.s24,
                  )
                : SizedBox(
                    height: Sz.i.s24,
                    width: Sz.i.s24,
                  ),
          ],
        ),
      ),
    );
  }

  void _onChooseType({
    required Function(dynamic data) onChanged,
  }) {
    showSheet(
      context,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 40),
            Text(
              S.current.typeBusiness,
              style: ptTitle1(context).copyWith(fontSize: Sz.i.s28),
            ),
            const SpacingBox(h: 16),
            Text(
              S.current.subtitle,
              style: ptTitle1(context)
                  .copyWith(fontSize: Sz.i.s17, height: 1.4118),
            ),
            const SpacingBox(h: 16),
            ColumnBuilder(
              data: data,
              separatorItem: const SpacingBox(h: 0),
              itemBuilder: (index) => InkWell(
                onTap: () {
                  onChanged(data[index]);
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: Sz.i.s68,
                  child: Row(
                    children: [
                      Image.asset(Images.company),
                      const SpacingBox(w: 16),
                      Text(
                        'Open account',
                        style: ptBodyLargeThin(context)
                            .copyWith(fontSize: Sz.i.s17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SpacingBox(h: 40),
          ],
        ),
      ),
    );
  }

  List<String> get data => ['Type 1', 'Type 2', 'Type 3', 'Type 4'];
  void _onChange({
    required String title,
    required TextEditingController controller,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    showSheet(
      context,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SpacingBox(h: 40),
            Text(
              title,
              style: ptTitle1(context).copyWith(fontSize: Sz.i.s20),
            ),
            const SpacingBox(h: 16),
            _buildTextField(context,
                controller: controller,
                keyboardType: keyboardType,
                autoFocus: true,
                focusWithBorder: true,
                label: title,
                onChanged: onChanged),
            const SpacingBox(h: 40),
            const BottomSpace(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    void Function(String)? onChanged,
    TextInputType? keyboardType,
    bool? autoFocus,
    bool? enabled,
    bool? focusWithBorder,
  }) {
    return AppRoundTextField.label(
      borderRadius: BorderRadius.circular(Sz.i.s20),
      contentPadding:
          EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
      backgroundColor: getColor(context).white.withOpacity(0.7),
      controller: controller,
      label: label,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.none,
      autoFocus: autoFocus,
      focusWithBorder: focusWithBorder ?? false,
      enabled: enabled ?? true,
      validation: (value) {
        return '';
      },
      onChanged: onChanged,
    );
  }
}
