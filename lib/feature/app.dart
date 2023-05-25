import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/provider/download_provider.dart';
import 'package:pine_app/core/util/widget_utils.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
export 'package:get/get.dart';
import '../core/theme/app_theme.dart';
import '../generated/l10n.dart';

import 'app.dart';
import 'splash/splash_screen.dart';

class PineApp extends StatelessWidget {
  const PineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Application();
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void dispose() {
    FileDownloader.instance.unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        dismissKeyboard(context);
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<FileDownloader>(
            create: (_) => FileDownloader.instance,
          ),
        ],
        child: Platform.isIOS
            ? CupertinoApp(
                debugShowCheckedModeBanner: false,
                theme: defaultThemeIOS,
                navigatorKey: Get.key,
                localizationsDelegates: localization,
                supportedLocales: S.delegate.supportedLocales,
                home: const SplashScreen(),
              )
            : MaterialApp(
                builder: DevicePreview.appBuilder,
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                debugShowCheckedModeBanner: false,
                theme: defaultThemeAndroid,
                navigatorKey: Get.key,
                localizationsDelegates: localization,
                supportedLocales: S.delegate.supportedLocales,
                home: const SplashScreen(),
              ),
      ),
    );
  }
}
