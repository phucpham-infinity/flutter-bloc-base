import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pine_app/core/env/env.dart';
import 'package:pine_app/core/provider/download_provider.dart';
import 'package:pine_app/feature/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      cameras = await availableCameras();
      prepareDownloadIsolate();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      await SentryFlutter.init(
        (options) {
          options
            ..dsn =
                'https://26fd17dcf37e47be8e528be3fec0d5cf@o4505194013130752.ingest.sentry.io/4505199928410112'
            ..tracesSampleRate = 1.0
            ..debug = kDebugMode;
        },
        appRunner: () => runApp(
          DevicePreview(
            enabled: false,
            builder: (context) => ProviderScope(child: PineApp()),
          ),
        ),
      );
    },
    (exception, stackTrace) async {
      if (!kDebugMode) {
        await Sentry.captureException(exception, stackTrace: stackTrace);
      }
    },
  );
}

Future<void> prepareDownloadIsolate() async {
  await FlutterDownloader.initialize(debug: dev, ignoreSsl: dev);
  FileDownloader.instance.bindBackgroundIsolate();
  FileDownloader.instance.registerCallBack();
  Future.delayed(
      Duration(seconds: 5), () => FileDownloader.instance.getExistingFiles());
}
