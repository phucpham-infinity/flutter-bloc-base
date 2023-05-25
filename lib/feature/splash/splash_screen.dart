import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/passcode/passcode_screen.dart';
import 'package:pine_app/feature/welcome/welcome_screen.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../core/base/local_storage.dart';
import '../../core/theme/icons/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 2), () async {
      String? token = await LocalStorage.instance.read(LocalStorage.KEY_TOKEN);

      if (token?.isNotEmpty ?? false) {
        navigateTo(const PassCodeScreen(
          isAuth: true,
        ));
      } else {
        navigateTo(const WelcomeScreen(), clearStack: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: Center(child: SvgPicture.asset(AppIcons.appLogo)),
    );
  }
}
