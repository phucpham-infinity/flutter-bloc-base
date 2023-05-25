import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/text_and_icon.dart';
import 'package:pine_app/feature/widget/camera/base_capture_screen.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

import '../yes_company/data_citizen_screen.dart';

class SelectAndDownloadScreen extends StatefulWidget {
  const SelectAndDownloadScreen({super.key});

  @override
  State<SelectAndDownloadScreen> createState() =>
      _SelectAndDownloadScreenState();
}

class _SelectAndDownloadScreenState extends State<SelectAndDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sz.i.s8),
              child: const BuildBackButton(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpacingBox(h: 12),
                  BuildTitleWithSub(
                      title: S.current.chooseAndUpload,
                      sub: S.current.selectADocumentTypeAndScan),
                  const SpacingBox(h: 24),
                  BuildTextAndIconButton(
                    onTap: () => navigateTo(
                      BaseCaptureScreen(
                        title: S.current.theFrontSideOf(S.current.emiratesID),
                        subTitle: S.current.allFourCornersMustFitIntoTheFrame,
                        onCapture: (data) => navigateTo(
                          BaseCaptureScreen(
                            title:
                                S.current.theBackSideOf(S.current.emiratesID),
                            subTitle:
                                S.current.allFourCornersMustFitIntoTheFrame,
                            onCapture: (data) => navigateTo(
                              const DataCitizenScreen(
                                data: DataCityzen.emiratesID,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    label: S.current.emiratesID,
                  ),
                  const SpacingBox(h: 16),
                  BuildTextAndIconButton(
                    onTap: () => navigateTo(
                      BaseCaptureScreen(
                        title: S.current.theFrontSideOf(S.current.passport),
                        subTitle: S.current.allFourCornersMustFitIntoTheFrame,
                        onCapture: (data) => navigateTo(
                          BaseCaptureScreen(
                            title: S.current.theBackSideOf(S.current.passport),
                            subTitle:
                                S.current.allFourCornersMustFitIntoTheFrame,
                            onCapture: (data) => navigateTo(
                              const DataCitizenScreen(
                                data: DataCityzen.passport,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    label: S.current.passport,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
