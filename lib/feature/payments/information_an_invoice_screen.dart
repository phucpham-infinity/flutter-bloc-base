import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

class InformationAnInvoiceScreen extends StatefulWidget {
  const InformationAnInvoiceScreen({super.key});

  @override
  State<InformationAnInvoiceScreen> createState() =>
      _InformationAnInvoiceScreenState();
}

class _InformationAnInvoiceScreenState
    extends State<InformationAnInvoiceScreen> {
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
                      child: const BuildBackButton(),
                    ),
                    const SpacingBox(h: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s24, vertical: Sz.i.s10),
                      child: Text(S.current.invoiceBeneficiary,
                          style: ptTitle4(context).copyWith(
                            fontSize: Sz.i.s24,
                            color: getColor(context).white,
                          )),
                    ),
                    const SpacingBox(h: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                          child: Text(
                            'My Company LLC',
                            style: pt20Navigo(context)
                                .copyWith(fontSize: Sz.i.s19),
                          ),
                        ),
                        Column(
                          children: [
                            _buildItem(context,
                                isTextField: true,
                                label: S.current.companyName,
                                textController: 'Isilan Istregert'),
                            _buildItem(context),
                            _buildItem(context,
                                isTextField: true,
                                label: 'IBAN',
                                textController:
                                    '123-1234-1234567-11234567-1890'),
                            _buildItem(context,
                                isTextField: true,
                                label: S.current.swiftCocdeBIC,
                                textController: 'My Company LLC'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    bool isTextField = false,
    String? textController,
    String? label,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Sz.i.s24).copyWith(bottom: Sz.i.s16),
      child: isTextField
          ? AppRoundTextField.label(
              borderRadius: BorderRadius.circular(Sz.i.s20),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sz.i.s24,
                vertical: Sz.i.s16,
              ),
              backgroundColor: getColor(context).white.withOpacity(0.7),
              controller: TextEditingController(text: textController),
              keyboardType: TextInputType.none,
              textInputAction: TextInputAction.none,
              validation: (value) {
                return '';
              },
              label: label,
              enabled: true,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s32, vertical: Sz.i.s16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: getColor(context).white.withOpacity(0.7),
              ),
              child: Row(
                children: [
                  Text(
                    S.current.currentAccount('*4567'),
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s15, color: const Color(0xff1E1C28)),
                  ),
                  const Spacer(),
                  const SpacingBox(w: 10),
                  SvgPicture.asset(AppIcons.icArrowRight),
                ],
              ),
            ),
    );
  }
}
