import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/icon_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';
import '../../../core/theme/size.dart';
import '../../widget/button/back_button.dart';
import '../../widget/container/spacing_box.dart';
import '../../widget/popup/feature_under_development.dart';

class DetailCardsScreen extends StatefulWidget {
  const DetailCardsScreen({super.key});

  @override
  State<DetailCardsScreen> createState() => _DetailCardsScreenState();
}

class _DetailCardsScreenState extends State<DetailCardsScreen> {
  final List<Item> _businessCard = [
    Item(name: 'Courier costs', icon: AppIcons.icCardSheraton),
    Item(name: 'Office costs', icon: AppIcons.icCardSheraton),
  ];

  final List<Item> _employeeCards = [
    Item(name: 'Courier costs', icon: AppIcons.icCardBarasti),
    Item(name: 'Office costs', icon: AppIcons.icCardBarasti),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sz.i.s8),
              child: Row(
                children: [
                  const BuildBackButton(),
                  Text(
                    'Current account *4567',
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s14, color: getColor(context).white),
                  )
                ],
              ),
            ),
            const SpacingBox(h: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTitleWithItem(context,
                        title: S.current.businessCard, data: _businessCard),
                    _buildTitleWithItem(context,
                        title: S.current.employeeCards, data: _employeeCards),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithItem(BuildContext context,
      {required String title, required List<Item> data}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24)
              .copyWith(bottom: Sz.i.s16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: ptBodyLargeBold(context).copyWith(
                    fontSize: Sz.i.s20,
                  )),
              BuildIconButton(
                icon: AppIcons.add,
                onTap: () {
                  showFeatureUnderDevelopment(context);
                },
              )
            ],
          ),
        ),
        ColumnBuilder(
          data: data,
          separatorItem: SizedBox(),
          itemBuilder: (index) {
            return _buildItem(name: data[index].name, icon: data[index].icon);
          },
        ),
      ],
    );
  }

  Widget _buildItem({required String name, required String icon}) {
    return InkWell(
      onTap: () {
        showFeatureUnderDevelopment(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Sz.i.s16, horizontal: Sz.i.s24),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: Sz.i.s48, height: Sz.i.s36),
            const SpacingBox(w: 16),
            Expanded(
              child: Text(
                name,
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s14,
                    height: 1.4118,
                    color: getColor(context).white),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String icon;

  Item({required this.name, required this.icon});
}
