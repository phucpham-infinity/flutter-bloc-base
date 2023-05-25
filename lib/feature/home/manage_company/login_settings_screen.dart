import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pine_app/core/base/local_storage.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/colors.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/passcode/passcode_screen.dart';
import 'package:pine_app/feature/phone_verification/enter_your_phone_number_screen.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class LoginSettingsScreen extends StatefulWidget {
  const LoginSettingsScreen({super.key});

  @override
  State<LoginSettingsScreen> createState() => _LoginSettingsScreenState();
}

class _LoginSettingsScreenState extends State<LoginSettingsScreen> {
  bool byFaceID = false;
  bool byTouchID = false;
  bool checkBiometrics = false;

  Future<bool> hasBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    return canCheckBiometrics;
  }

  @override
  void initState() {
    super.initState();
    hasBiometrics().then((value) => {
          checkBiometrics = value,
        });
  }

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
                child: const BuildBackButton(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s24, vertical: Sz.i.s10),
                child: Text(
                  S.current.loginSettings,
                  style: ptTitle4(context).copyWith(
                      fontSize: Sz.i.s24, color: getColor(context).white),
                ),
              ),
              const SpacingBox(h: 24),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                child: Text(
                  S.current.login,
                  style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
                ),
              ),
              _buildItemLogin(context, label: S.current.updatePhoneNumber,
                  onTap: () {
                navigateTo(
                  const EnterYourPhoneNumberScreen(
                    isLoginSettings: true,
                  ),
                );
              }),
              _buildItemLogin(context, label: S.current.changePIN, onTap: () {
                navigateTo(const PassCodeScreen(
                  isLoginSettings: true,
                ));
              }),
              const SpacingBox(h: 24),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                child: Text(
                  S.current.quickLogin,
                  style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
                ),
              ),
              if (Platform.isIOS)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sz.i.s24, vertical: Sz.i.s16),
                  child: Row(
                    children: [
                      Text(S.current.enableFaceID,
                          style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s14,
                              height: 1.4118,
                              color: getColor(context).white)),
                      const Spacer(),
                      const SpacingBox(w: 16),
                      CupertinoSwitch(
                        value: byFaceID,
                        trackColor: Colors.black.withOpacity(0.15),
                        activeColor: AppColors.primaryLightActive,
                        onChanged: (value) {
                          if (checkBiometrics) {
                            LocalStorage.instance
                                .writeBool(LocalStorage.BY_FACE_ID, value);
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              if (Platform.isAndroid)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sz.i.s24, vertical: Sz.i.s16),
                  child: Row(
                    children: [
                      Text(S.current.enableTouchID,
                          style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s14,
                              height: 1.4118,
                              color: getColor(context).white)),
                      const Spacer(),
                      const SpacingBox(w: 16),
                      CupertinoSwitch(
                        value: byTouchID,
                        trackColor: Colors.black.withOpacity(0.15),
                        activeColor: AppColors.primaryLightActive,
                        onChanged: (value) {
                          byTouchID = value;
                          LocalStorage.instance
                              .writeBool(LocalStorage.BY_TOUCH_ID, value);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemLogin(
    BuildContext context, {
    required String label,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
        child: Row(
          children: [
            Text(label,
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s14,
                    height: 1.4118,
                    color: getColor(context).white)),
            const Spacer(),
            SvgPicture.asset(AppIcons.chevronRightMd,
                width: Sz.i.s24, height: Sz.i.s24),
          ],
        ),
      ),
    );
  }
}
