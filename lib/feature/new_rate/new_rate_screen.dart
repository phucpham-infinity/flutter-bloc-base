import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/new_rate/businesses_detail_screen.dart';
import 'package:pine_app/feature/widget/button/app_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class NewRateScreen extends StatefulWidget {
  const NewRateScreen({super.key});

  @override
  State<NewRateScreen> createState() => _NewRateScreenState();
}

class _NewRateScreenState extends State<NewRateScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int selectedindex = 0;

  final List<Item> _listItem = [
    Item(
        title: S.current.basic,
        description: '900 AED/year',
        image: Images.smallRate),
    Item(
        title: S.current.optimal,
        description: '1 500 AED/year',
        image: Images.mediumRate),
    Item(
        title: S.current.premium,
        description: '2 200 AED/year',
        image: Images.largeRate),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              left: 0,
              child: SizedBox(
                width: deviceWidth(context),
                child: Image.asset(
                  _listItem[selectedindex].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Sz.i.s8),
                  child: BuildBackButton(
                    iconBackButton: AppIcons.exit,
                    widthIcon: Sz.i.s24,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SpacingBox(h: 12),
                            BuildTitleWithSub(
                                title: S.current.chooseARate,
                                sub: S.current
                                    .toStartUsingTheBankOpenAnAccountForYourBusiness),
                            const SpacingBox(h: 32),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              selectedindex = page;
                            });
                          },
                          itemCount: _listItem.length,
                          itemBuilder: (context, index) {
                            return _buildItem(
                              context,
                              item: _listItem[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SpacingBox(h: 65)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, {required Item item}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s4),
      child: FrostedContainer(
        blur: 12,
        padding: EdgeInsets.all(Sz.i.s24),
        radius: Sz.i.s40,
        boxShadow: [],
        bgColor: getColor(context).white.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: ptBodySemiBold(context)
                  .copyWith(fontSize: Sz.i.s40, color: getColor(context).white),
            ),
            const SpacingBox(h: 40),
            Row(
              children: [
                Text(
                  item.description,
                  style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s17,
                    height: 1.4118,
                    color: getColor(context).white,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    navigateTo(BusinessesDetailScreen(title: item.title));
                  },
                  child: SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: Sz.i.s24,
                    height: Sz.i.s24,
                  ),
                )
              ],
            ),
            const SpacingBox(h: 40),
            AppButton.primary(
              widthButton: Sz.i.s114,
              onTap: () {
                navigateTo(BusinessesDetailScreen(title: item.title));
              },
              label: S.current.join,
              enabled: true,
              forceUppercase: false,
            ),
            const Spacer(),
            Row(
              children: _buildPageIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: isActive ? Sz.i.s16 : Sz.i.s8,
      width: isActive ? Sz.i.s16 : Sz.i.s8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? getColor(context).white
            : getColor(context).white.withOpacity(0.7),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _listItem.length; i++) {
      if (i == 1) {
        list.add(i == selectedindex
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s16),
                child: _indicator(true),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s16),
                child: _indicator(false),
              ));
      } else {
        list.add(i == selectedindex ? _indicator(true) : _indicator(false));
      }
    }
    return list;
  }
}

class Item {
  final String title;
  final String description;
  final String image;

  Item({
    required this.title,
    required this.image,
    required this.description,
  });
}
