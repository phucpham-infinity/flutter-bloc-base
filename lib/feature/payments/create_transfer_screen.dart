import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/enum/payer_type.dart';
import 'package:pine_app/core/enum/purpose_payment_type.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/form_validator_utils.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/payments/success_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/date_picker/app_date_picker.dart';
import 'package:pine_app/feature/widget/date_time/date_time.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

import '../phone_verification/enter_the_code_screen.dart';
import '../widget/popup/show_date_picker.dart';
import 'information_transfer_screen.dart';

class CreateTransferScreen extends StatefulWidget {
  const CreateTransferScreen({super.key});

  @override
  State<CreateTransferScreen> createState() => _CreateTransferScreenState();
}

class _CreateTransferScreenState extends State<CreateTransferScreen> {
  PayerType? payerType;
  PurposePaymentType? purposePaymentType;
  String? payBefore;

  int selectedIndexPurposePayment = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _swiftCodeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  bool get _enable =>
      _nameController.text.isNotEmpty &&
      _swiftCodeController.text.isNotEmpty &&
      _amountController.text.isNotEmpty &&
      payerType != null &&
      purposePaymentType != null;

  @override
  void initState() {
    payerType = _listPayerType.first;
    purposePaymentType = _listPurposePaymentType.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BuildBackButton(),
                          Padding(
                            padding: EdgeInsets.only(right: Sz.i.s16),
                            child: GestureDetector(
                                onTap: () =>
                                    showFeatureUnderDevelopment(context),
                                child: SvgPicture.asset(AppIcons.menu)),
                          ),
                        ],
                      ),
                    ),
                    const SpacingBox(h: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildTitleWithSub(
                            title: S.current.newTransfer,
                            sub: ' №1_01_01',
                          )
                        ],
                      ),
                    ),
                    const SpacingBox(h: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s26)
                          .copyWith(bottom: Sz.i.s16),
                      child: FrostedContainer(
                          onTap: () {
                            navigateTo(const InfomationTransferScreen());
                          },
                          bgColor: const Color(0xffE5EFF0),
                          padding: EdgeInsets.symmetric(
                              horizontal: Sz.i.s32, vertical: Sz.i.s36),
                          child: Row(
                            children: [
                              Text(
                                'My Company LLC',
                                style: ptBodyLargeThin(context).copyWith(
                                  fontSize: Sz.i.s15,
                                  height: 1.3333,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.icArrowRight,
                                height: Sz.i.s24,
                                width: Sz.i.s24,
                              ),
                            ],
                          )),
                    ),
                    _buildItemWithTitle(
                      context,
                      title: S.current.toText,
                      children: [
                        _buildItem(
                          context,
                          isTextField: true,
                          label: S.current.companyName,
                          controller: _nameController,
                        ),
                        _buildItem(
                          context,
                          isTextField: true,
                          label: S.current.recipientIBAN,
                          controller: _recipientController,
                          onChanged: (value) {},
                        ),
                        _buildItem(
                          context,
                          isTextField: true,
                          label: S.current.recipientSWIFTCode,
                          controller: _swiftCodeController,
                        ),
                      ],
                    ),
                    const SpacingBox(h: 16),
                    _buildItemWithTitle(
                      context,
                      title: S.current.transferDetails,
                      children: [
                        _buildItem(context,
                            contentContainer: purposePaymentType!.displayName,
                            onTap: () {
                          _showPurposePayment(onChanged: (value) {
                            setState(() {
                              purposePaymentType =
                                  _listPurposePaymentType[value];
                              selectedIndexPurposePayment = value;
                            });
                            Navigator.pop(context);
                          });
                        }),
                        _buildItem(context,
                            isTextField: true,
                            label: S.current.amount,
                            controller: _amountController,
                            keyboardType: TextInputType.number),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sz.i.s24),
              child: AppExpandButton.primary(
                onTap: () {
                  navigateTo(EnterTheCodeScreen(
                    onNext: () {
                      navigateTo(SuccessScreen());
                    },
                  ));
                },
                label: S.current.send,
                forceUppercase: false,
                enabled: _enable,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemWithTitle(BuildContext context,
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
          child: Text(
            title,
            style: pt20Navigo(context).copyWith(fontSize: Sz.i.s19),
          ),
        ),
        Column(children: children)
      ],
    );
  }

  Widget _buildItem(
    BuildContext context, {
    bool isTextField = false,
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? label,
    String? contentContainer,
    void Function()? onTap,
    void Function(String)? onChanged,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Sz.i.s24).copyWith(bottom: Sz.i.s16),
      child: isTextField
          ? AppRoundTextField.label(
              borderRadius: BorderRadius.circular(Sz.i.s20),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sz.i.s32,
                vertical: Sz.i.s16,
              ),
              backgroundColor: getColor(context).white.withOpacity(0.7),
              controller: controller!,
              keyboardType: keyboardType ?? TextInputType.text,
              textInputAction: TextInputAction.none,
              validation: (value) {
                return '';
              },
              onChanged: onChanged,
              label: label,
              enabled: true,
            )
          : _buildContainerItem(onTap, contentContainer, context),
    );
  }

  Widget _buildContainerItem(
      void Function()? onTap, String? contentContainer, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s32, vertical: Sz.i.s16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getColor(context).white.withOpacity(0.7),
        ),
        child: Row(
          children: [
            Text(
              contentContainer ?? '',
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s15, color: const Color(0xff1E1C28)),
            ),
            const Spacer(),
            const SpacingBox(w: 10),
            SvgPicture.asset(AppIcons.icArrowRight),
          ],
        ),
      ),
    );
  }

  List<PayerType> get _listPayerType => [
        PayerType.legalEntity,
        PayerType.individual,
      ];

  void _showTypeOfPayer({
    required Function(dynamic data) onChanged,
  }) {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpacingBox(h: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: Text(
              S.current.typeOfPayer,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          ColumnBuilder(
            data: _listPayerType,
            separatorItem: const SpacingBox(h: 0),
            itemBuilder: (index) => InkWell(
              onTap: () {
                onChanged(_listPayerType[index]);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s16),
                child: Row(
                  children: [
                    Text(
                      _listPayerType[index].displayName,
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s17,
                          color: const Color.fromARGB(255, 79, 75, 97)),
                    ),
                    const Spacer(),
                    const SpacingBox(w: 16),
                    SvgPicture.asset(
                      _listPayerType[index] == payerType
                          ? AppIcons.radioButton
                          : AppIcons.uncheck,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SpacingBox(h: 40),
        ],
      ),
    );
  }

  List<PurposePaymentType> get _listPurposePaymentType => [
        PurposePaymentType.purposePayment,
        PurposePaymentType.purposePayment,
        PurposePaymentType.purposePayment,
        PurposePaymentType.purposePayment,
      ];
  List<String> get purposeOfPayment => [
        'Payment for Goods',
        'Payment for Services',
        'Transport & Travel',
        'Other'
      ];
  void _showPurposePayment({
    required Function(dynamic data) onChanged,
  }) {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpacingBox(h: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: Text(
              S.current.purposePayment,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          ColumnBuilder(
            data: purposeOfPayment,
            separatorItem: const SpacingBox(h: 0),
            itemBuilder: (index) => InkWell(
              onTap: () {
                onChanged(index);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s16),
                child: Row(
                  children: [
                    Text(
                      purposeOfPayment[index],
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s17,
                          color: const Color.fromARGB(255, 79, 75, 97)),
                    ),
                    const Spacer(),
                    const SpacingBox(w: 16),
                    SvgPicture.asset(
                      index == selectedIndexPurposePayment
                          ? AppIcons.radioButton
                          : AppIcons.uncheck,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SpacingBox(h: 40),
        ],
      ),
    );
  }
}
