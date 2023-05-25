import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/mockups/country/country.dart';
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
import 'package:pine_app/generated/l10n.dart';

import '../form_company/form_company.dart';
import '../widget/dropdown/dropdown.dart';

enum DataCityzen { emiratesID, passport }

class DataCitizenScreen extends StatefulWidget {
  final DataCityzen data;
  const DataCitizenScreen({super.key, required this.data});

  @override
  State<DataCitizenScreen> createState() => _DataCitizenScreenState();
}

class _DataCitizenScreenState extends State<DataCitizenScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _issueDateController = TextEditingController();
  final TextEditingController _expriryDateController = TextEditingController();
  bool _firstName = false;
  bool _lastName = false;
  bool _idNumber = false;
  bool _nationlity = false;
  bool get _enable =>
      _firstName && _lastName && _idNumber && _currentIndex != -1;

  List<CountryModel> listCountry = countryData.countries;

  int _currentIndex = -1;
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
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
                          child: BuildTitleWithSub(
                            title: S.current.confirmYourDetails,
                            sub: S.current.ensureTheInformationProvided,
                          ),
                        ),
                        const SpacingBox(h: 42),
                        if (widget.data == DataCityzen.emiratesID)
                          Text(
                            S.current.emiratesID,
                            style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s20,
                              color: getColor(context).white,
                            ),
                          ),
                        if (widget.data == DataCityzen.passport)
                          Text(
                            S.current.passport,
                            style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s20,
                              color: getColor(context).white,
                            ),
                          ),
                        const SpacingBox(h: 24),
                        _buildTextField(context,
                            controller: _firstNameController,
                            label: S.current.firstName, onChanged: (value) {
                          setState(() {
                            _firstName = FormValidator.notEmptyValidate(value);
                          });
                        }),
                        const SpacingBox(h: 16),
                        _buildTextField(context,
                            controller: _lastNameController,
                            label: S.current.lastName, onChanged: (value) {
                          setState(() {
                            _lastName = FormValidator.notEmptyValidate(value);
                          });
                        }),
                        const SpacingBox(h: 16),
                        CustomDropdown<String>(
                          currentIndex: 0,
                          onChange: (value, index) {
                            _nationalityController.text =
                                listCountry[index].name ?? '';
                            _currentIndex = index;
                            setState(() {});
                          },
                          dropdownStyle: DropdownStyle(
                              padding: EdgeInsets.zero,
                              borderRadius: BorderRadius.circular(Sz.i.s20)),
                          dropdownButtonStyle: DropdownButtonStyle(
                              width: double.infinity,
                              radius: Sz.i.s20,
                              padding: EdgeInsets.zero,
                              borderColor: Colors.transparent,
                              backgroundColor: Colors.transparent),
                          items: listCountry
                              .map((item) => DropdownItem<String>(
                                  value: item.name,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(item.name ?? ''),
                                  )))
                              .toList(),
                          leadingIcon: true,
                          child: _buildTextField(context,
                              controller: _nationalityController,
                              label: S.current.nationality,
                              onChanged: (value) {}),
                        ),
                        if (_nationlity) Text(S.current.error),
                        const SpacingBox(h: 16),
                        _buildTextField(
                          context,
                          controller: _idNumberController,
                          label: widget.data == DataCityzen.passport
                              ? S.current.passportNumber
                              : S.current.idNumber,
                          onChanged: (value) {
                            setState(() {
                              _idNumber = FormValidator.notEmptyValidate(value);
                            });
                          },
                        ),
                        if (widget.data == DataCityzen.passport) ...[
                          const SpacingBox(h: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(context,
                                    controller: _issueDateController,
                                    label: S.current.issueDate,
                                    onChanged: (value) {}),
                              ),
                              const SpacingBox(h: 32),
                              if (widget.data == DataCityzen.emiratesID)
                                Text(
                                  S.current.emiratesID,
                                  style: ptBodyLargeBold(context).copyWith(
                                    fontSize: Sz.i.s20,
                                    color: getColor(context).white,
                                  ),
                                ),
                              if (widget.data == DataCityzen.passport)
                                Text(
                                  S.current.foreignPassport,
                                  style: ptBodyLargeBold(context).copyWith(
                                    fontSize: Sz.i.s20,
                                    color: getColor(context).white,
                                  ),
                                ),
                              const SpacingBox(h: 24),
                              _buildTextField(
                                context,
                                controller: _firstNameController,
                                label: S.current.firstName,
                                onChanged: (value) {
                                  setState(() {
                                    _firstName =
                                        FormValidator.notEmptyValidate(value);
                                  });
                                },
                              ),
                              const SpacingBox(h: 16),
                              _buildTextField(context,
                                  controller: _lastNameController,
                                  label: S.current.lastName,
                                  onChanged: (value) {
                                setState(() {
                                  _lastName =
                                      FormValidator.notEmptyValidate(value);
                                });
                              }),
                              const SpacingBox(h: 16),
                              CustomDropdown<CountryModel>(
                                currentIndex: 0,
                                onChange: (value, index) {
                                  _nationalityController.text =
                                      listCountry[index].code!;
                                  _currentIndex = index;
                                  setState(() {});
                                },
                                dropdownStyle: DropdownStyle(
                                    padding: EdgeInsets.zero,
                                    borderRadius:
                                        BorderRadius.circular(Sz.i.s20)),
                                dropdownButtonStyle: DropdownButtonStyle(
                                    width: double.infinity,
                                    radius: Sz.i.s20,
                                    padding: EdgeInsets.zero,
                                    borderColor: Colors.transparent,
                                    backgroundColor: Colors.transparent),
                                items: listCountry
                                    .map((item) => DropdownItem<CountryModel>(
                                        value: item,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(item.code!),
                                        )))
                                    .toList(),
                                leadingIcon: true,
                                child: _buildTextField(context,
                                    controller: _nationalityController,
                                    label: S.current.nationality,
                                    onChanged: (value) {}),
                              ),
                              if (_nationlity) Text(S.current.error),
                              const SpacingBox(h: 16),
                              _buildTextField(context,
                                  controller: _idNumberController,
                                  keyboardType: TextInputType.number,
                                  label: S.current.idNumber,
                                  onChanged: (value) {
                                setState(() {
                                  _idNumber =
                                      FormValidator.notEmptyValidate(value);
                                });
                              }),
                              if (widget.data == DataCityzen.passport) ...[
                                const SpacingBox(h: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextField(context,
                                          controller: _issueDateController,
                                          label: S.current.issueDate,
                                          onChanged: (value) {}),
                                    ),
                                    const SpacingBox(w: 16),
                                    Expanded(
                                      child: _buildTextField(context,
                                          controller: _expriryDateController,
                                          label: S.current.expiryDate,
                                          onChanged: (value) {}),
                                    ),
                                  ],
                                ),
                              ],
                              const SpacingBox(h: 60),
                            ],
                          ),
                        ],
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: AppExpandButton.primary(
                forceUppercase: false,
                enabled: _enable,
                onTap: () {
                  if (_currentIndex == -1) {
                    _nationlity = true;
                  }
                  navigateTo(const FormCompanyScreen());
                },
                label: S.current.next,
              ),
            ),
            const SpacingBox(h: 20),
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
  }) {
    return AppRoundTextField.label(
      borderRadius: BorderRadius.circular(Sz.i.s20),
      contentPadding:
          EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
      backgroundColor: getColor(context).white.withOpacity(0.7),
      controller: controller,
      label: label,
      enabled: true,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.none,
      validation: (value) {
        return '';
      },
      onChanged: onChanged,
    );
  }
}
