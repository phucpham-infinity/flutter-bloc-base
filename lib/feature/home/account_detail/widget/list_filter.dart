import 'package:flutter/material.dart';
import 'package:pine_app/core/model/account_detail_history.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class BuildListFilter extends StatefulWidget {
  const BuildListFilter({super.key});

  @override
  State<BuildListFilter> createState() => _BuildListFilterState();
}

class _BuildListFilterState extends State<BuildListFilter> {
  final List<AccountDetailHistory> _listYesterday = [
    AccountDetailHistory(
        title: 'Transfer from',
        subscription: 'Jeffrey Thomson',
        image: Images.jfGreen,
        price: 'AED250.15'),
    AccountDetailHistory(
        title: 'Netflix',
        subscription: 'Subscription',
        image: Images.arrowReload,
        price: '−  AED250.15'),
    AccountDetailHistory(
        title: 'Netflix',
        subscription: 'Subscription',
        image: Images.starbucks,
        price: '−  AED250.15'),
    AccountDetailHistory(
        title: 'Transfer from',
        subscription: 'Jeffrey Thomson',
        image: Images.jfPurple,
        price: '−  AED250.15'),
  ];

  final List<AccountDetailHistory> _listToday = [
    AccountDetailHistory(
        title: 'Netflix',
        subscription: 'Subscription',
        image: Images.netflix,
        price: '−  AED250.15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacingBox(h: 25),
        _buildItem(context, title: S.current.today, listFilter: _listToday),
        _buildItem(context,
            title: S.current.yesterday, listFilter: _listYesterday),
      ],
    );
  }

  Widget _buildItem(BuildContext context,
      {required String title, required List<AccountDetailHistory> listFilter}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Sz.i.s24),
          child: Text(
            title,
            style: ptBodyLargeThin(context).copyWith(
              fontSize: Sz.i.s14,
              height: 1.7143,
              color: getColor(context).white.withOpacity(0.6),
            ),
          ),
        ),
        ColumnBuilder(
            data: listFilter,
            itemBuilder: (index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: Sz.i.s16)
                      .copyWith(left: Sz.i.s24, right: Sz.i.s36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(listFilter[index].image ?? '',
                          width: Sz.i.s48, height: Sz.i.s48),
                      const SpacingBox(w: 16),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listFilter[index].title,
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                height: 1.7143,
                                color: getColor(context).white),
                          ),
                          Text(
                            listFilter[index].subscription ?? '',
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                height: 1.7143,
                                color: getColor(context).white),
                          ),
                        ],
                      )),
                      const SpacingBox(w: 16),
                      Text(listFilter[index].price ?? '',
                          style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s16,
                              color: getColor(context).white))
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
