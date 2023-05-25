import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/home/account_detail/detail_card_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/container/progress_finish_screen.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/size.dart';
import '../../widget/button/back_button.dart';

class BusinessCardsScreen extends StatefulWidget {
  const BusinessCardsScreen({super.key});

  @override
  State<BusinessCardsScreen> createState() => _BusinessCardsScreenState();
}

class _BusinessCardsScreenState extends State<BusinessCardsScreen> {
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
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.current.nowTheCard,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SpacingBox(h: 16),
                      Text(
                        S.current.weWillContactYou,
                        style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s14,
                          height: 1.7143,
                          color: getColor(context).white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SpacingBox(h: 40),
                      AppExpandButton.primary(
                          forceUppercase: false,
                          enabled: true,
                          onTap: () {
                            launch('tel://0385140807');
                          },
                          label: S.current.callNow),
                      const SpacingBox(h: 16),
                      AppExpandButton.primary(
                          backgroundTransparent: true,
                          forceUppercase: false,
                          enabled: true,
                          onTap: () {
                            navigateTo(ProgressFinishScreen(
                                onTap: () {
                                  navigateTo(const DetailCardsScreen());
                                },
                                title: S.current.requestAccepted,
                                content:
                                    S.current.anOperatorWillContactYouShortly,
                                icon: AppIcons.checkBig,
                                buttonText: S.current.ok));
                          },
                          textColor: getColor(context).black,
                          label: S.current.leaveARequest),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
