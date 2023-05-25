import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';

Future<void> showAppDatePicker(
  BuildContext context, {
  required Widget child,
  double sigma = 10,
}) async {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Dialog(
          insetPadding: EdgeInsets.all(Sz.i.s8),
          backgroundColor: Colors.transparent,
          child: child),
    ),
  );
}
