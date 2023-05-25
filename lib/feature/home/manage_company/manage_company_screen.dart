import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/home/manage_company/company_data_screen.dart';
import 'package:pine_app/feature/home/manage_company/confirming_transactions_screen.dart';
import 'package:pine_app/feature/home/manage_company/login_settings_screen.dart';
import 'package:pine_app/feature/notification/notification_screen.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

import '../../new_rate/rate_limit_screen.dart';
import '../../phone_verification/enter_your_phone_number_screen.dart';

class ManageCompanyScreen extends StatefulWidget {
  const ManageCompanyScreen({super.key});

  @override
  State<ManageCompanyScreen> createState() => _ManageCompanyScreenState();
}

class _ManageCompanyScreenState extends State<ManageCompanyScreen> {
  final List<Item> _listItem = [
    Item(icon: Images.squircleIconsPerson, title: S.current.loginSettings),
    Item(icon: Images.squircleIconsChang, title: S.current.pendingTransactions),
    Item(icon: Images.squircleIconsBell, title: S.current.notification),
    Item(icon: Images.squircleIconsExit, title: S.current.signOut),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              Images.backgroundCompany,
              width: deviceWidth(context),
              height: deviceHeight(context) * 0.37,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sz.i.s8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BuildBackButton(),
                          Padding(
                            padding: EdgeInsets.only(right: Sz.i.s16),
                            child: GestureDetector(
                              onTap: () {
                                showFeatureUnderDevelopment(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Sz.i.s12),
                                  color:
                                      getColor(context).white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(Sz.i.s6),
                                child: SvgPicture.asset(
                                  AppIcons.fileDocument,
                                  width: Sz.i.s24,
                                  height: Sz.i.s24,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SpacingBox(h: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s24, vertical: Sz.i.s10),
                      child: Text(
                        S.current.pineCompany,
                        style: ptTitle4(context).copyWith(
                          fontSize: Sz.i.s24,
                          color: getColor(context).white,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SpacingBox(h: 63),
                    FrostedContainer(
                      onTap: () {
                        navigateTo(const RateLimitScreen());
                      },
                      bgColor: getColor(context).white,
                      padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s32, vertical: Sz.i.s36),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.circleCheckbox,
                            width: Sz.i.s18,
                            height: Sz.i.s18,
                          ),
                          const SpacingBox(w: 10),
                          Expanded(
                              child: Text(
                            S.current.premium,
                            style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s15,
                            ),
                          )),
                          const SpacingBox(w: 10),
                          SvgPicture.asset(
                            AppIcons.icArrowRight,
                            width: Sz.i.s24,
                            height: Sz.i.s24,
                          )
                        ],
                      ),
                    ),
                    FrostedContainer(
                      onTap: () {
                        navigateTo(const CompanyDataScreen());
                      },
                      bgColor: const Color(0xffBECBCB),
                      padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s32, vertical: Sz.i.s22),
                      child: Row(
                        children: [
                          Text(
                            S.current.companyInformation,
                            style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s15,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            AppIcons.icArrowRight,
                            width: Sz.i.s24,
                            height: Sz.i.s24,
                          )
                        ],
                      ),
                    ),
                    const SpacingBox(h: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                          child: Text(
                            S.current.settings,
                            style: pt20Navigo(context)
                                .copyWith(fontSize: Sz.i.s19),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == _listItem.length - 1) {
                                return Column(
                                  children: [
                                    const SpacingBox(h: 40),
                                    _buildItem(
                                      context,
                                      icon: _listItem[index].icon,
                                      title: _listItem[index].title,
                                      onTap: () {
                                        navigateTo(
                                            EnterYourPhoneNumberScreen());
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return _buildItem(
                                  context,
                                  icon: _listItem[index].icon,
                                  title: _listItem[index].title,
                                  onTap: () {
                                    if (index == 0) {
                                      navigateTo(const LoginSettingsScreen());
                                    } else if (index == 1) {
                                      navigateTo(
                                          const ConfirmTransactionsScreen());
                                    } else if (index == 2) {
                                      navigateTo(const NotificationScreen());
                                    }
                                  },
                                );
                              }
                            },
                            itemCount: _listItem.length),
                        const SpacingBox(h: 24),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required String icon,
      required String title,
      required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: Sz.i.s48,
              height: Sz.i.s36,
            ),
            const SpacingBox(w: 16),
            Text(
              title,
              style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s17,
                color: getColor(context).white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String icon;
  final String title;

  Item({required this.icon, required this.title});
}
