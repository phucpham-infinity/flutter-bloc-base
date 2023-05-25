import 'dart:io';

import 'package:pine_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget kLoadingSpinner(BuildContext context, {Color? color}) => Platform.isIOS
    ? _kLoadingCupertinoSpinner(color: color ?? getColor(context).black)
    : _kLoadingMaterialSpinner(color: color ?? getColor(context).black);

Widget _kLoadingMaterialSpinner({Color? color}) => Center(
      child: SizedBox(
        height: Sz.i.s22,
        width: Sz.i.s22,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: Sz.i.s2,
        ),
      ),
    );

Widget _kLoadingCupertinoSpinner({Color? color}) => Center(
      child: SpinKitFadingCircle(
        size: Sz.i.s30,
        color: color,
      ),
    );
Widget Function(BuildContext, Object, StackTrace?)? imageNetworkErrorBuilder =
    (_, __, ___) => SizedBox.shrink();

Widget Function(BuildContext, Widget, ImageChunkEvent?)? kLoadingBuilder =
    (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
        loadingProgress != null ? kLoadingSpinner(context) : child;
