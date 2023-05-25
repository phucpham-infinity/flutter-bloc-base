import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class ConfirmTransactionsScreen extends StatefulWidget {
  const ConfirmTransactionsScreen({super.key});

  @override
  State<ConfirmTransactionsScreen> createState() =>
      _ConfirmTransactionsScreenState();
}

class _ConfirmTransactionsScreenState extends State<ConfirmTransactionsScreen> {
  final List<String> _listItemConfirmActions = [
    S.current.faceID,
    S.current.pushNotification,
    S.current.textMessage,
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s8),
                child: const BuildBackButton(),
              ),
              SpacingBox(h: 12),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s10),
                child: Text(
                  S.current.transactionConfirmations,
                  style: ptTitle4(context).copyWith(
                      fontSize: Sz.i.s24, color: getColor(context).white),
                ),
              ),
              const SpacingBox(h: 24),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                child: Text(
                  S.current.confirmationMethods,
                  style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    if (Platform.isAndroid) {
                      return _buildItemConfirmActions(
                        context,
                        label: S.current.byTouchID,
                        index: index,
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      );
                    } else {
                      return _buildItemConfirmActions(context,
                          label: S.current.byFaceID, index: index, onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      });
                    }
                  } else {
                    return _buildItemConfirmActions(context,
                        label: _listItemConfirmActions[index],
                        index: index, onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    });
                  }
                },
                itemCount: _listItemConfirmActions.length,
              ),
              const SpacingBox(h: 24),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                child: Text(
                  S.current.mainAccount,
                  style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: GestureDetector(
                  onTap: () {
                    _showAccount(
                      onChanged: (data) {},
                    );
                  },
                  child: Container(
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
                              fontSize: Sz.i.s15,
                              color: const Color(0xff1E1C28)),
                        ),
                        const Spacer(),
                        const SpacingBox(w: 10),
                        SvgPicture.asset(AppIcons.icArrowRight),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemConfirmActions(BuildContext context,
      {required String label, required int index, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
        child: Row(
          children: [
            Text(
              label,
              style: ptBodyLargeThin(context).copyWith(
                  fontSize: Sz.i.s17,
                  height: 1.4118,
                  color: getColor(context).white),
            ),
            const Spacer(),
            SvgPicture.asset(
              _selectedIndex == index
                  ? AppIcons.radioButton
                  : AppIcons.uncheck2,
              width: Sz.i.s24,
              height: Sz.i.s24,
            ),
          ],
        ),
      ),
    );
  }

  List<String> get _listAccountType => [
        S.current.currentAccount('*4567'),
        S.current.currentAccount('*4567'),
        S.current.currentAccount('*4567'),
      ];

  void _showAccount({
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
              S.current.mainAccount,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          ColumnBuilder(
            data: _listAccountType,
            separatorItem: const SpacingBox(h: 0),
            itemBuilder: (index) => InkWell(
              onTap: () {
                onChanged(_listAccountType[index]);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s16),
                child: Row(
                  children: [
                    Image.asset(
                      Images.bank,
                      width: Sz.i.s48,
                      height: Sz.i.s36,
                    ),
                    const SpacingBox(w: 16),
                    Text(
                      _listAccountType[index],
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
