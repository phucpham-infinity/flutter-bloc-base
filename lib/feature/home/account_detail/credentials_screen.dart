import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

Future showCredentialsScreen(BuildContext context) {
  return showSheet(context, child: const CredentialsScreen());
}

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  final List<Item> _listItem = [
    Item(S.current.companyName, 'My Company'),
    Item(S.current.accountNumber, '60000000000004567'),
    Item(S.current.IBAN, '123-1234-1234567-11234567-1890'),
    Item(S.current.swiftCocdeBIC, 'PIBAEDUXX'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s40)
                  .copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.current.accountDetails,
                style: ptBodyLargeBold(context).copyWith(
                  fontSize: Sz.i.s28,
                  color: getColor(context).black,
                ),
              ),
              const SpacingBox(h: 16),
              Text(
                S.current.currentAccount('*4567'),
                style: ptBodyLargeThin(context).copyWith(
                  fontSize: Sz.i.s17,
                  height: 1.4118,
                  color: getColor(context).black,
                ),
              )
            ],
          ),
        ),
        const SpacingBox(h: 24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = _listItem[index];
            return _buildItem(item: item);
          },
          itemCount: _listItem.length,
        ),
        const SpacingBox(h: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: AppExpandButton.primary(
            onTap: () {
              showFeatureUnderDevelopment(context);
            },
            label: S.current.share,
            enabled: true,
            forceUppercase: false,
          ),
        ),
        const SpacingBox(h: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: AppExpandButton.primary(
            onTap: () {
              showFeatureUnderDevelopment(context);
            },
            label: S.current.download,
            enabled: true,
            forceUppercase: false,
            textColor: getColor(context).black,
            backgroundTransparent: true,
          ),
        ),
        const SpacingBox(h: 24)
      ],
    );
  }

  Widget _buildItem({required Item item}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16)
          .copyWith(top: 0),
      child: AppRoundTextField.label(
        controller: TextEditingController(text: item.value),
        keyboardType: TextInputType.none,
        textInputAction: TextInputAction.none,
        validation: (value) {
          return '';
        },
        hasFocus: true,
        label: item.label,
        focusWithBorder: true,
        borderRadius: BorderRadius.circular(Sz.i.s20),
      ),
    );
  }
}

class Item {
  final String label;
  final String value;

  Item(this.label, this.value);
}
