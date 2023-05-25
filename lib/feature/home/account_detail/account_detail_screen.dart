import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/colors.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/home/account_detail/business_cards_screen.dart';
import 'package:pine_app/feature/home/account_detail/credentials_screen.dart';
import 'package:pine_app/feature/home/transfer_screen.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/home/account_detail/history_account_detail_screen.dart';
import '../../../core/theme/size.dart';
import '../../../generated/l10n.dart';
import '../../new_analitics/new_analitics_screen.dart';
import '../../widget/button/back_button.dart';
import '../../widget/button/round_button.dart';
import '../../widget/container/spacing_box.dart';
import '../../widget/popup/feature_under_development.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({super.key});

  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  int _currentIndex = 0;
  List<String> get filters => [S.current.deposit, S.current.statement];
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      appBar: AppBar(
        leading: BuildBackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Pinebank',
          style: ptBodyLargeThin(context)
              .copyWith(fontSize: Sz.i.s14, color: getColor(context).white),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.icDocument),
            onPressed: () {
              showFeatureUnderDevelopment(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 34),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: Text(
                S.current.aed(0),
                style: ptBodySemiBold(context).copyWith(
                    fontSize: Sz.i.s40, color: getColor(context).white),
              ),
            ),
            const SpacingBox(h: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: Text(
                S.current.currentAccount('*4567'),
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s14, color: getColor(context).white),
              ),
            ),
            const SpacingBox(h: 28),
            SizedBox(
              height: Sz.i.s44,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: Sz.i.s24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RoundButton(
                  text: filters[index],
                  selected: _currentIndex == index,
                  onTap: () {
                    if (index == 0) {
                      _showDeposit();
                    }
                    _currentIndex = index;
                    if (_currentIndex == 1) {
                      navigateTo(const HistoryAccountDetailScreen());
                    }
                    setState(() {});
                  },
                ),
                separatorBuilder: (context, index) => SpacingBox(w: Sz.i.s8),
                itemCount: filters.length,
              ),
            ),
            SpacingBox(h: Sz.i.s22),
            _buildOption(
              onTap: () => navigateTo(NewAnaliticsScreen()),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s32, vertical: Sz.i.s24),
              text: S.current.financialOverview,
              icon: AppIcons.icArrowRight,
              color: AppColors.bgCard,
            ),
            SpacingBox(h: Sz.i.s16),
            _buildOption(
              onTap: () => showCredentialsScreen(context),
              text: S.current.accountDetails,
              icon: AppIcons.icArrowRight,
            ),
            SpacingBox(h: Sz.i.s16),
            _buildOption(
              onTap: () => navigateTo(const BusinessCardsScreen()),
              text: S.current.bankCards,
              icon: AppIcons.icCard,
            ),
            SpacingBox(h: Sz.i.s16),
            _buildOption(
              onTap: () => navigateTo(const BusinessCardsScreen()),
              text: S.current.ratesAndLimits,
              icon: AppIcons.icArrowRight,
            )
          ],
        ),
      ),
    );
  }

  void _showDeposit() {
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
              S.current.deposit,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: Text(
              S.current.selectAMethod,
              style: ptBodyLargeThin(context).copyWith(
                  fontSize: Sz.i.s17,
                  height: 1.4118,
                  color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              navigateTo(const TransferScreen());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s24, vertical: Sz.i.s16),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.icByCard,
                      width: Sz.i.s48, height: Sz.i.s36),
                  const SpacingBox(w: 16),
                  Text(
                    S.current.cardText,
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s17,
                        color: const Color.fromARGB(255, 79, 75, 97)),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              navigateTo(const TransferScreen());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s24, vertical: Sz.i.s16),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.icByCash,
                      width: Sz.i.s48, height: Sz.i.s36),
                  const SpacingBox(w: 16),
                  Text(
                    S.current.cash,
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s17,
                        color: const Color.fromARGB(255, 79, 75, 97)),
                  ),
                ],
              ),
            ),
          ),
          const SpacingBox(h: 40),
        ],
      ),
    );
  }

  Widget _buildOption(
      {bool spaceBetweem = true,
      Color color = Colors.white30,
      EdgeInsets? padding,
      EdgeInsets? margin,
      TextStyle? textStyle,
      required String text,
      required VoidCallback onTap,
      required String icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(Sz.i.s24),
        margin: margin ?? EdgeInsets.symmetric(horizontal: Sz.i.s8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Text(
              text,
              style: textStyle ??
                  ptBodyLargeThin(context)
                      .copyWith(fontSize: Sz.i.s17, height: 1.4118),
            ),
            spaceBetweem ? const Spacer() : const SpacingBox(w: 13),
            SvgPicture.asset(icon),
          ],
        ),
      ),
    );
  }
}
