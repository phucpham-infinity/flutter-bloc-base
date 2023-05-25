import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/new_rate/rate_limit_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/question_circle_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class BusinessesDetailScreen extends StatefulWidget {
  final String title;
  const BusinessesDetailScreen({super.key, required this.title});

  @override
  State<BusinessesDetailScreen> createState() => _BusinessesDetailScreenState();
}

class _BusinessesDetailScreenState extends State<BusinessesDetailScreen> {
  final List<Item> _listItem = [
    Item(
        title: S.current.transactions,
        description:
            '0% commission on monthly transactions up to AED 10 000, then 2% for each additional AED 1 000'),
    Item(
        title: S.current.atmDeposits,
        description:
            '0% commission on monthly deposits up to AED 8 000, then 2% for each additional AED 1 000'),
    Item(
        title: S.current.bankCardsChequeBooks,
        description:
            'Free issuance for up to 6 cards or cheque books, followed by a fee of AED 200 each'),
    Item(
        title: S.current.addOns,
        description: '20% discount on add-on services'),
  ];
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BuildBackButton(),
                    BuildQuestionCircleButton(onTap: () {
                      navigateTo(const RateLimitScreen());
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpacingBox(h: 8),
                    BuildTitleWithSub(
                      title: widget.title.replaceAll('\n', ' '),
                      sub:
                          'Essential banking features for startups and small businesses',
                    )
                  ],
                ),
              ),
              const SpacingBox(h: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SpacingBox(h: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _buildItem(context, _listItem[index]),
                  itemCount: _listItem.length,
                ),
              ),
              const SpacingBox(h: 11),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24),
                child: AppExpandButton.primary(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  label: S.current.join,
                  forceUppercase: false,
                  enabled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Item item) {
    return FrostedContainer(
      bgColor: getColor(context).white.withOpacity(0.15),
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        ),
      ],
      padding: EdgeInsets.all(Sz.i.s24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          item.title,
          style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
        ),
        const SpacingBox(h: 24),
        Divider(
          color: const Color(0xffE0E0E0),
          height: Sz.i.s1,
          thickness: Sz.i.s1,
        ),
        const SpacingBox(h: 16),
        Text(
          item.description,
          style: ptBodyLargeThin(context).copyWith(
            fontSize: Sz.i.s17,
            height: 1.4118,
            color: getColor(context).white,
          ),
        )
      ]),
    );
  }
}

class Item {
  final String title;
  final String description;

  Item({required this.title, required this.description});
}
