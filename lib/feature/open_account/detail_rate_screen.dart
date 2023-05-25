import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/main/main_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/question_circle_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class DetailRateScreen extends StatefulWidget {
  const DetailRateScreen({super.key});

  @override
  State<DetailRateScreen> createState() => _DetailRateScreenState();
}

class _DetailRateScreenState extends State<DetailRateScreen> {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BuildBackButton(),
                          BuildQuestionCircleButton(onTap: () {
                            showFeatureUnderDevelopment(context);
                          }),
                        ],
                      ),
                    ),
                    SpacingBox(h: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildTitleWithSub(
                            title: S.current.basicRate,
                            sub:
                                'Basic rate turnover up to \$ 8 000\nwithout commission',
                          )
                        ],
                      ),
                    ),
                    const SpacingBox(h: 21),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SpacingBox(h: 16),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => _buildItem(context),
                        itemCount: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sz.i.s24),
              child: AppExpandButton.primary(
                onTap: () => navigateTo(MainScreen(), clearStack: true),
                label: S.current.connect,
                forceUppercase: false,
                enabled: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return FrostedContainer(
      boxShadow: [],
      padding: EdgeInsets.all(Sz.i.s24).copyWith(right: Sz.i.s9),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          S.current.paymentsToIndividualsAndCashWithdrawals,
          style: pt20Navigo(context).copyWith(
              fontSize: Sz.i.s19, height: 1.2631, fontWeight: FontWeight.w700),
        ),
        const SpacingBox(h: 24),
        Divider(
          color: const Color(0xffE0E0E0),
          height: Sz.i.s1,
          thickness: Sz.i.s1,
        ),
        const SpacingBox(h: 16),
        Text(
          'Taxеs - 0% up to \$ 8,000\nthen 2% of each \$1,000',
          style: pt17SFProText(context),
        ),
      ]),
    );
  }
}
