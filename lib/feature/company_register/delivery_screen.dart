import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/open_account/choose_a_rate_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/date_picker/app_date_picker.dart';
import 'package:pine_app/feature/widget/date_time/date_time.dart';
import 'package:pine_app/feature/widget/popup/show_date_picker.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';
import '../../core/theme/images/images.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreennState();
}

class _DeliveryScreennState extends State<DeliveryScreen> {
  final TextEditingController _enterNumberController = TextEditingController();
  final TextEditingController _flatNumberController = TextEditingController();
  final TextEditingController _commentsForCourierController =
      TextEditingController();

  String? _deliveryDay;
  String? _deliveryTime;
  String _enterNumber = '';
  String _flatNumber = '';

  bool get _enable =>
      _flatNumber.isNotEmpty &&
      _enterNumber.isNotEmpty &&
      _deliveryDay != null &&
      _deliveryTime != null;

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
                          BuildTitleWithSub(
                            title: S.current.signTheDocuments,
                            sub: S.current
                                .weWillSendACourierToYouWithAPackageOfDocuments,
                          ),
                          const SpacingBox(h: 32),
                          Text(
                            'Nearest delivery March 23',
                            style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s20,
                              color: getColor(context).white,
                            ),
                          ),
                          const SpacingBox(h: 24),
                          _buildOption(
                              onTap: () {
                                showAppDatePicker(context, child: AppDatePicker(
                                  onSelect: (dateTime) {
                                    _deliveryDay = dateTime.MMddYYYY();
                                    setState(() {});
                                  },
                                ));
                              },
                              hintText: S.current.deliveryDay,
                              value: _deliveryDay ?? ''),
                          const SpacingBox(h: 16),
                          _buildOption(
                              onTap: () => _onChooseType(
                                    onChanged: (data) {
                                      _deliveryTime = data;
                                      setState(() {});
                                    },
                                  ),
                              hintText: S.current.deliveryTime,
                              value: _deliveryTime ?? ''),
                          const SpacingBox(h: 16),
                          _buildOption(
                              onTap: () {},
                              hintText: S.current.shippingAddress,
                              value: ''),
                          const SpacingBox(h: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(context,
                                    controller: _enterNumberController,
                                    label: S.current.enterNumber,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                  setState(() {
                                    _enterNumber = value;
                                  });
                                }),
                              ),
                              const SpacingBox(w: 16),
                              Expanded(
                                child: _buildTextField(context,
                                    controller: _flatNumberController,
                                    label: S.current.flatNumber,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                  setState(() {
                                    _flatNumber = value;
                                  });
                                }),
                              ),
                            ],
                          ),
                          const SpacingBox(h: 16),
                          AppRoundTextField(
                              controller: _commentsForCourierController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.newline,
                              validation: (value) {
                                return '';
                              },
                              enabled: true,
                              backgroundColor:
                                  getColor(context).white.withOpacity(0.7),
                              hintText: S.current.commentsForCourier),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sz.i.s24),
              child: AppExpandButton.primary(
                forceUppercase: false,
                enabled: _enable,
                onTap: () async {
                  navigateTo(const ChooseARateScreen());
                },
                label: S.current.confirmDelivery,
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
                        color: getColor(context).textActive,
                        height: 1.3333),
                  )
                : Text(
                    value,
                    style: ptBodyLargeThin(context)
                        .copyWith(fontSize: Sz.i.s15, height: 1.3333),
                  ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.icArrowRight,
              width: Sz.i.s24,
              height: Sz.i.s24,
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
              S.current.time,
              style: ptTitle1(context).copyWith(fontSize: Sz.i.s20),
            ),
            const SpacingBox(h: 16),
            Text(
              S.current.subtitle,
              style: ptTitle1(context).copyWith(fontSize: Sz.i.s20),
            ),
            const SpacingBox(h: 16),
            ColumnBuilder(
              data: dataTime,
              separatorItem: const SpacingBox(h: 0),
              itemBuilder: (index) => InkWell(
                onTap: () {
                  onChanged(dataTime[index]);
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: Sz.i.s68,
                  child: Row(
                    children: [
                      Image.asset(Images.company),
                      const SpacingBox(w: 16),
                      Text(
                        dataTime[index],
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

  List<String> get dataTime => ['6am-9am', '9am-12am', '12am-3pm', '3pm-6pm'];

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
