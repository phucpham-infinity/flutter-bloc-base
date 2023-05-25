import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

import 'select_and_download_screen.dart';

class YouAreACitizenScreen extends StatelessWidget {
  const YouAreACitizenScreen({super.key});

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
                      title: S.current.areYouAUAECitizen,
                      sub: S.current.requiredToSetUpANewCompany),
                  const Spacer(),
                  AppExpandButton.primary(
                      forceUppercase: false,
                      enabled: true,
                      onTap: () {
                        navigateTo(const SelectAndDownloadScreen());
                      },
                      label: S.current.yes),
                  const SpacingBox(h: 16),
                  AppExpandButton.primary(
                      backgroundTransparent: true,
                      forceUppercase: false,
                      enabled: true,
                      onTap: () {
                        navigateTo(SelectAndDownloadScreen());
                      },
                      textColor: getColor(context).black,
                      label: S.current.no),
                  const SpacingBox(h: 24),
                ],
              ),
            ),
            BuildBackButton()
          ],
        ),
      ),
    );
  }
}
