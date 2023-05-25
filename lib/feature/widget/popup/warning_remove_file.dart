import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/generated/l10n.dart';

void showWarningRemoveFile(
    BuildContext context, String fileName, void Function()? onRemove) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          S.current.doYouWantToRemove(fileName),
          style: ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s17),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(S.current.no),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            onPressed: onRemove,
            child: Text(S.current.yes),
          ),
        ],
      );
    },
  );
}
