import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/generated/l10n.dart';

void showFeatureUnderDevelopment(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: CupertinoAlertDialog(
          title: Text(S.current.underDevelopment),
          content: Text(S.current.thisFeatureIsUnderDevelopment),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(S.current.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
