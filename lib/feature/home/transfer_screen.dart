import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/keyboard_number/keyboard_number.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:intl/intl.dart';
import '../../core/theme/images/images.dart';
import '../../core/theme/size.dart';
import '../../core/util/navigation_utils.dart';
import '../../generated/l10n.dart';
import '../widget/button/app_expand_button.dart';
import '../widget/popup/show_sheet.dart';
import 'choose_away.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _amountController = TextEditingController();
  String get _amount => _amountController.text.replaceAll('AED', '').trim();
  int _currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: IndexedStack(
        index: _currentPage,
        children: [
          _buildTransfer(),
          _buildSuccess(),
        ],
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      children: [
        SafeArea(
            child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: Sz.i.s8),
            child: BuildBackButton(),
          ),
        )),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.icSuccess,
          width: Sz.i.s88,
          height: Sz.i.s88,
        ),
        const SpacingBox(h: 32),
        Text(
          S.current.successfully,
          style: ptTitle4(context)
              .copyWith(fontSize: Sz.i.s24, color: getColor(context).white),
        ),
        const SpacingBox(h: 16),
        Text(
          S.current.replenishmentOfTheAccount(_amount),
          textAlign: TextAlign.center,
          style: ptBodyLargeThin(context).copyWith(
              fontSize: Sz.i.s14,
              height: 1.7143,
              color: getColor(context).white),
        ),
        const SpacingBox(h: 24),
        Container(
            margin: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            padding:
                EdgeInsets.symmetric(horizontal: Sz.i.s32, vertical: Sz.i.s16),
            decoration: BoxDecoration(
                color: const Color(0xffC3CFC5),
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              S.current.yourDepositWillBeProcessed,
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s14, height: 1.7143),
            )),
        const SpacingBox(h: 24),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: AppExpandButton.primary(
            forceUppercase: false,
            onTap: () async {
              navigateTo(ChooseAWayScreen());
            },
            label: S.current.saveTheCheck,
            enabled: true,
          ),
        ),
        const SpacingBox(h: 29),
      ],
    );
  }

  Widget _buildTransfer() {
    return Column(
      children: [
        const Spacer(flex: 2),
        Text(
          S.current.selectTheCardToTransferFrom,
          style: ptButton(context)
              .copyWith(fontSize: Sz.i.s20, color: getColor(context).white),
        ),
        const SpacingBox(h: 16),
        GestureDetector(
          onTap: _showCards,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icVisa),
              const SpacingBox(w: 10),
              Text(
                S.current.card('***4567'),
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s17, color: getColor(context).white),
              ),
              SvgPicture.asset(AppIcons.icArrowRight,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              const SpacingBox(w: 16),
            ],
          ),
        ),
        const Spacer(),
        _buildTextField(),
        const Spacer(),
        KeyboardNumber(
          onTapClear: _onTapClear,
          onTapNumber: _onTapNumber,
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        AppIcons.roundArrow,
                        width: Sz.i.s55,
                        height: Sz.i.s55,
                      )),
                ),
              ),
              Flexible(
                flex: 2,
                child: AppExpandButton.primary(
                  forceUppercase: false,
                  onTap: () async {
                    // final result = await AuthBiometrics.authenticate();
                    // if (result) {
                    //   _currentPage = 1;
                    //   setState(() {});
                    // }
                    _currentPage = 1;
                    setState(() {});
                  },
                  label: S.current.next,
                  enabled: _amount.isNotEmpty,
                ),
              ),
            ],
          ),
        ),
        const SpacingBox(h: 29),
      ],
    );
  }

  void _onTapNumber(int number) async {
    final format = NumberFormat('#,###');
    final amount = int.parse('$_amount$number'.replaceAll(' ', ''));
    _amountController.text =
        'AED ${format.format(amount).replaceAll(',', ' ')}';
    setState(() {});
  }

  void _onTapClear() {
    if (_amount.length > 1) {
      _amountController.text =
          'AED ${_amount.substring(0, _amount.length - 1)}';
    } else {
      _amountController.clear();
    }
    setState(() {});
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: _amountController,
      enabled: false,
      textAlign: TextAlign.center,
      cursorHeight: Sz.i.s40,
      cursorColor: Colors.white,
      style: ptBodyLargeThin(context)
          .copyWith(fontSize: Sz.i.s40, color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: S.current.aed('0'),
        hintStyle: ptBodyLargeThin(context)
            .copyWith(fontSize: Sz.i.s40, color: Colors.white70),
      ),
    );
  }

  void _showCards() {
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
              S.current.cards,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: Text(
              S.current.chooseWhereToTransferMoney,
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s17, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          ColumnBuilder(
            data: [1, 2],
            itemBuilder: (index) => InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s16),
                child: Row(
                  children: [
                    Image.asset(Images.card, width: Sz.i.s48, height: Sz.i.s36),
                    const SpacingBox(w: 16),
                    Text(
                      S.current.card('***4567'),
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s17,
                          color: const Color.fromARGB(255, 79, 75, 97)),
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
