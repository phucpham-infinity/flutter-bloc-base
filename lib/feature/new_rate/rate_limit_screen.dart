import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/new_rate/new_rate_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/question_circle_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_cupertino_popup.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class RateLimitScreen extends StatefulWidget {
  const RateLimitScreen({super.key});

  @override
  State<RateLimitScreen> createState() => _RateLimitScreenState();
}

class _RateLimitScreenState extends State<RateLimitScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Item> _listItem = [
    Item(
        title: S.current.transactions,
        information: 'AED 10,000/80,000',
        description: 'Commission 0%',
        value: 0.125),
    Item(
        title: S.current.atmDeposits,
        information: 'AED 8,000/10,000',
        description: 'Commission 0%',
        value: 0.8),
    Item(
        title: S.current.bankCardsChequeBooks,
        information: '6/6',
        description: 'Taxes AED200 of each card',
        value: 1),
    Item(
        title: S.current.transfers,
        information: 'AED 6,000/8,000',
        description: 'Commission 0%',
        value: 0.75),
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
                    const SpacingBox(h: 8),
                    BuildTitleWithSub(
                      title: S.current.rateLimits,
                      sub: S.current.ifTheLimits,
                    )
                  ],
                ),
              ),
              const SpacingBox(h: 24),
              ListView.separated(
                separatorBuilder: (context, index) => const SpacingBox(h: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _buildItem(
                  context,
                  _listItem[index],
                  onTap: () {
                    showCupertinoPopup(
                      context,
                      controller: _controller,
                      title: _listItem[index].title,
                      onChanged: (value) {},
                      onSave: () {
                        setState(() {
                          if (double.tryParse(_controller.text) != null &&
                              double.tryParse(_controller.text)! <= 1 &&
                              double.tryParse(_controller.text)! >= 0 &&
                              _controller.text.isNotEmpty) {
                            _listItem[index].value =
                                double.tryParse(_controller.text)!;
                            _controller.clear();
                            Get.back();
                          } else {
                            Get.back();
                          }
                        });
                      },
                    );
                  },
                ),
                itemCount: _listItem.length,
              ),
              const SpacingBox(h: 11),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24),
                child: AppExpandButton.primary(
                  onTap: () {
                    navigateTo(NewRateScreen());
                  },
                  label: S.current.change,
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

  Widget _buildItem(BuildContext context, Item item, {void Function()? onTap}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
          child: Row(
            children: [
              Text(
                item.title,
                style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
              ),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  AppIcons.editPencil,
                  width: Sz.i.s24,
                  height: Sz.i.s24,
                ),
              )
            ],
          ),
        ),
        const SpacingBox(h: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24)
              .copyWith(bottom: Sz.i.s16),
          child: Stack(
            children: [
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                barRadius: Radius.circular(Sz.i.s20),
                backgroundColor: getColor(context).black.withOpacity(0.15),
                animation: true,
                lineHeight: Sz.i.s80,
                animationDuration: 2000,
                percent: item.value,
                progressColor: const Color(0xff46797C),
              ),
              Positioned(
                left: Sz.i.s16,
                top: Sz.i.s16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.information,
                      style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s17,
                        color: getColor(context).white,
                      ),
                    ),
                    const SpacingBox(h: 4),
                    Text(
                      item.description,
                      style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s12,
                        color: getColor(context).white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Item {
  final String information;
  final String description;
  final String title;
  double value;

  Item(
      {required this.information,
      required this.description,
      required this.title,
      required this.value});
}
