import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/yes_company/check_the_data_screen.dart';
import 'package:pine_app/generated/l10n.dart';

import '../no_company/you_are_a_citizen_screen.dart';
import '../widget/camera/base_capture_screen.dart';

class EnterYourCompanyInformationScreen extends StatelessWidget {
  const EnterYourCompanyInformationScreen({super.key});

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
                      title: S.current.provideYourCompany,
                      sub: S.current.toOpenANewAccount),
                  const Spacer(),
                  AppExpandButton.primary(
                    forceUppercase: false,
                    enabled: true,
                    label: S.current.scanTheLicense,
                    onTap: () => navigateTo(BaseCaptureScreen(
                        title: S.current.theFrontSideOfTheDocument,
                        subTitle: S.current.allFourCornersMustFitIntoTheFrame,
                        onCapture: (data) => navigateTo(
                              const CheckTheDataScreen(),
                            ))),
                  ),
                  const SpacingBox(h: 16),
                  AppExpandButton.primary(
                      backgroundTransparent: true,
                      forceUppercase: false,
                      enabled: true,
                      onTap: () => navigateTo(const YouAreACitizenScreen()),
                      textColor: getColor(context).black,
                      label: S.current.registerACompany),
                  const SpacingBox(h: 24),
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
