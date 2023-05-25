import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/main/main_screen.dart';
import 'package:pine_app/feature/open_account/detail_rate_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/question_circle_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class ChooseARateScreen extends StatefulWidget {
  const ChooseARateScreen({super.key});

  @override
  State<ChooseARateScreen> createState() => _ChooseARateScreenState();
}

class _ChooseARateScreenState extends State<ChooseARateScreen> {
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
                      showFeatureUnderDevelopment(context);
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpacingBox(h: 12),
                    BuildTitleWithSub(
                      title: S.current.chooseARate,
                      sub: S.current
                          .toStartUsingTheBankOpenAnAccountForYourBusiness,
                    )
                  ],
                ),
              ),
              const SpacingBox(h: 21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SpacingBox(h: 16),
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
    );
  }

  Widget _buildItem(BuildContext context) {
    return FrostedContainer(
      padding: EdgeInsets.zero,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: () => navigateTo(const DetailRateScreen()),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: Sz.i.s24, horizontal: Sz.i.s24)
                    .copyWith(right: Sz.i.s9, bottom: Sz.i.s16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.current.basicRate,
                      style: pt20Navigo(context)
                          .copyWith(fontSize: Sz.i.s19, height: 1.2631),
                    ),
                    SvgPicture.asset(
                      AppIcons.chevronRight,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                    ),
                  ],
                ),
                SpacingBox(h: 24),
                Divider(
                  color: const Color(0xffE0E0E0),
                  height: Sz.i.s1,
                  thickness: Sz.i.s1,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Sz.i.s24).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic rate turnover up to \$ 8 000\nwithout commission',
                style: pt17SFProText(context),
              ),
              const SpacingBox(h: 16),
              AppExpandButton.primary(
                onTap: () => navigateTo(MainScreen(), clearStack: true),
                label: S.current.connect,
                forceUppercase: false,
                enabled: true,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
