import 'package:flutter/material.dart';
import 'package:pine_app/core/util/navigation_utils.dart';

import '../../../../core/theme/size.dart';
import '../../../../generated/l10n.dart';

import '../widget/button/back_button.dart';
import '../widget/button/text_and_icon.dart';
import '../widget/column/title_with_sub.dart';
import '../widget/container/spacing_box.dart';
import '../widget/scaffold/base_gradient_scaffold.dart';
import 'map_screen.dart';

class ChooseAWayScreen extends StatefulWidget {
  const ChooseAWayScreen({super.key});

  @override
  State<ChooseAWayScreen> createState() => _ChooseAWayScreenState();
}

class _ChooseAWayScreenState extends State<ChooseAWayScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpacingBox(h: 56),
                  BuildTitleWithSub(
                      title: S.current.selectAMethod,
                      sub: S.current.weDisplayCashDeposit),
                  const SpacingBox(h: 24),
                  BuildTextAndIconButton(
                    onTap: () {
                      navigateTo(MapScreen());
                    },
                    label: S.current.atms,
                  ),
                  const SpacingBox(h: 16),
                  BuildTextAndIconButton(
                    onTap: () {
                      navigateTo(MapScreen());
                    },
                    label: S.current.cashDepositPoints,
                  )
                ],
              ),
            ),
            const BuildBackButton(),
          ],
        ),
      ),
    );
  }
}
