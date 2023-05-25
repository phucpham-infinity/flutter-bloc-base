import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/enum/product_type.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/home/account_detail/account_detail_screen.dart';
import 'package:pine_app/feature/home/manage_company/manage_company_screen.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../generated/l10n.dart';
import '../widget/button/round_button.dart';
import '../widget/popup/feature_under_development.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? balance = '5680';

  int _currentIndex = 0;

  List<String> get filters => [
        S.current.transfer,
        S.current.invoicing,
        S.current.statement,
      ];

  List<ProductType> get _listProductType =>
      [ProductType.openAccount, ProductType.changeRate, ProductType.newService];

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: FrostedContainer(
                blur: Sz.i.s6,
                padding: EdgeInsets.all(Sz.i.s10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () => showFeatureUnderDevelopment(context),
                        child: SvgPicture.asset(
                          AppIcons.home,
                          width: Sz.i.s36,
                          height: Sz.i.s36,
                        )),
                    const SpacingBox(w: 14),
                    Container(
                        height: Sz.i.s24,
                        width: Sz.i.s2,
                        color: Colors.white.withOpacity(0.2)),
                    const SpacingBox(w: 14),
                    GestureDetector(
                      onTap: () => navigateTo(ManageCompanyScreen()),
                      child: Row(
                        children: [
                          Text(
                            'Company 12345',
                            style: ptButton(context).copyWith(
                                fontSize: Sz.i.s16,
                                color: getColor(context).primaryNormal),
                          ),
                          const SpacingBox(w: 14),
                          SvgPicture.asset(AppIcons.icArrowDown),
                        ],
                      ),
                    ),
                    const SpacingBox(w: 14),
                    Container(
                        height: Sz.i.s24,
                        width: Sz.i.s2,
                        color: Colors.white.withOpacity(0.2)),
                    const SpacingBox(w: 14),
                    GestureDetector(
                        onTap: () => showFeatureUnderDevelopment(context),
                        child: SvgPicture.asset(AppIcons.menu)),
                  ],
                ),
              ),
            ),

            const SpacingBox(h: 34),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: Text(
                S.current.aed(balance ?? 0),
                style: ptBodySemiBold(context).copyWith(
                    fontSize: Sz.i.s40, color: getColor(context).white),
              ),
            ),
            const SpacingBox(h: 20),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            //   child: Text(
            //     S.current.withOverdraft(balance ?? 0),
            //     style: ptBodyLargeThin(context).copyWith(
            //         fontSize: Sz.i.s14, color: getColor(context).white),
            //   ),
            // ),
            const SpacingBox(h: 28),
            balance != null
                ? SizedBox(
                    height: Sz.i.s44,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: Sz.i.s24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RoundButton(
                        borderRadius: Sz.i.s16,
                        padding: EdgeInsets.symmetric(
                            horizontal: Sz.i.s16, vertical: Sz.i.s12),
                        text: filters[index],
                        selected: _currentIndex == index,
                        onTap: () {
                          _currentIndex = index;
                          setState(() {});
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          SpacingBox(w: Sz.i.s8),
                      itemCount: filters.length,
                    ),
                  )
                : const SpacingBox(h: 44),
            const SpacingBox(h: 52),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s24, vertical: Sz.i.s16),
              child: Row(
                children: [
                  Text(
                    S.current.products,
                    style: ptBodyLargeBold(context).copyWith(
                      fontSize: Sz.i.s20,
                      color: getColor(context).primaryNormal,
                    ),
                  ),
                  const Spacer(),
                  RoundButton(
                    height: Sz.i.s36,
                    onTap: () => _showNewProduct(
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    selected: true,
                    text: S.current.newText,
                    padding: EdgeInsets.symmetric(
                        horizontal: Sz.i.s16, vertical: Sz.i.s8),
                  )
                ],
              ),
            ),

            // no account
            if (balance == null) _buildInfoNoAccount(),
            if (balance != null) ...[
              const SpacingBox(h: 25),
              _buildInfoAccount()
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildInfoNoAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
      child: Column(
        children: [
          const SpacingBox(h: 63),
          Center(
            child: Text(
              S.current.accountOpeningTakesUp,
              textAlign: TextAlign.center,
              style: pt17SFProText(context)
                  .copyWith(color: getColor(context).white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoAccount() {
    return InkWell(
      onTap: () => navigateTo(const AccountDetailScreen()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
        child: SizedBox(
          width: deviceWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.currentAccount('*4567'),
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s16, color: getColor(context).textSecondary),
              ),
              const SpacingBox(h: 12),
              Text(
                S.current.aed(balance ?? ''),
                style: ptBodyLargeBold(context).copyWith(
                    fontSize: Sz.i.s24, color: getColor(context).white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNewProduct({
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
              S.current.newProduct,
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
          ),
          const SpacingBox(h: 16),
          ColumnBuilder(
            data: _listProductType,
            separatorItem: const SpacingBox(h: 0),
            itemBuilder: (index) => InkWell(
              onTap: () {
                onChanged(_listProductType[index]);
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
                      _listProductType[index].displayName,
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
