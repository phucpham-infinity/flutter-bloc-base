import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/icons/icons.dart';
import '../../core/theme/size.dart';
import '../../core/theme/text_style.dart';
import '../../core/util/auth_biometrics.dart';
import '../../core/util/navigation_utils.dart';
import '../../core/util/widget_utils.dart';
import '../../generated/l10n.dart';
import '../home/home_screen.dart';
import '../widget/button/app_button.dart';
import '../widget/button/app_expand_button.dart';
import '../widget/button/back_button.dart';
import '../widget/scaffold/base_gradient_scaffold.dart';
import '../yes_company/enter_your_company_information _screen.dart';

class SettingBiometricScreen extends StatefulWidget {
  const SettingBiometricScreen({super.key});

  @override
  State<SettingBiometricScreen> createState() => _SettingBiometricScreenState();
}

class _SettingBiometricScreenState extends State<SettingBiometricScreen> {
  bool _hasBiometrics = false;
  bool _hasFaceID = false;

  Future<void> checkBiometrics() async {
    final hasBiometrics = await AuthBiometrics.hasBiometrics();
    _hasBiometrics = hasBiometrics;
    if (Platform.isIOS) {
      final hasFaceId = await AuthBiometrics.hasFaceID();
      _hasFaceID = hasFaceId;
      if (hasFaceId) {
        final result = await AuthBiometrics.authenticate();
        if (result) {
          navigateTo(const HomeScreen());
        }
      }
    }
    if (Platform.isAndroid) {
      if (hasBiometrics) {
        final result = await AuthBiometrics.authenticate();
        if (result) {
          navigateTo(const HomeScreen());
        }
      }
    }
    oncChanged();
  }

  @override
  void initState() {
    super.initState();
    onWidgetBuildDone(checkBiometrics);
  }

  void oncChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 14),
            Padding(
              padding: EdgeInsets.only(left: Sz.i.s8),
              child: const BuildBackButton(),
            ),
            Expanded(
              child: _hasFaceID ? _buildFaceID() : _buildTouchID(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTouchID() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(
            AppIcons.icTouchId,
            width: Sz.i.s88,
            height: Sz.i.s88,
          ),
          const SpacingBox(h: 32),
          Text(
            S.current.enableTouchID,
            style: ptTitle4(context)
                .copyWith(fontSize: Sz.i.s24, color: getColor(context).white),
          ),
          const SpacingBox(h: 16),
          Text(
            S.current.byPassEnteringCodeTouchID,
            textAlign: TextAlign.center,
            style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s14,
                height: 1.7143,
                color: getColor(context).white),
          ),
          const Spacer(),
          AppExpandButton.primary(
            onTap: () => navigateTo(EnterYourCompanyInformationScreen()),
            forceUppercase: false,
            label: S.current.enableTouchID,
            enabled: true,
          ),
          const SpacingBox(h: 16),
          AppExpandButton.primary(
            onTap: () => navigateTo(EnterYourCompanyInformationScreen()),
            forceUppercase: false,
            label: S.current.skip,
            backgroundTransparent: true,
            textColor: getColor(context).black,
            enabled: true,
          ),
          const SpacingBox(h: 20),
        ],
      ),
    );
  }

  Widget _buildFaceID() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(AppIcons.icFaceId,
              width: Sz.i.s88, height: Sz.i.s88),
          const SpacingBox(h: 32),
          Text(
            S.current.enableFaceID,
            style: ptTitle4(context)
                .copyWith(fontSize: Sz.i.s24, color: getColor(context).white),
          ),
          const SpacingBox(h: 16),
          Text(
            S.current.byPassEnteringCodeFaceID,
            textAlign: TextAlign.center,
            style: ptBodyLargeThin(context).copyWith(
              fontSize: Sz.i.s14,
              color: getColor(context).white,
              height: 1.7143,
            ),
          ),
          const Spacer(),
          AppExpandButton.primary(
            onTap: () => navigateTo(EnterYourCompanyInformationScreen()),
            forceUppercase: false,
            label: S.current.enableFaceID,
            enabled: true,
          ),
          const SpacingBox(h: 16),
          AppExpandButton.icon(
            onTap: () => navigateTo(EnterYourCompanyInformationScreen()),
            iconPosition: AppIconButtonPosition.none,
            label: Text(S.current.skip,
                style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s16)),
            enabled: true,
          ),
          const SpacingBox(h: 20),
        ],
      ),
    );
  }
}
