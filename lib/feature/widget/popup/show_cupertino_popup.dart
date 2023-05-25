import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';

Future<void> showCupertinoPopup(
  BuildContext context, {
  required String title,
  required TextEditingController controller,
  required void Function(String)? onChanged,
  void Function()? onSave,
}) async {
  showDialog<bool>(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: CupertinoAlertDialog(
          title: Text(
            title,
            style: ptBodyLarge(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
          content: Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                const SpacingBox(h: 8),
                AppRoundTextField.label(
                  borderRadius: BorderRadius.circular(Sz.i.s20),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: Sz.i.s24, vertical: Sz.i.s16),
                  backgroundColor: getColor(context).white.withOpacity(0.7),
                  controller: controller,
                  label: S.current.typeValue,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.none,
                  autoFocus: true,
                  // focusWithBorder: focusWithBorder ?? false,
                  enabled: true,
                  validation: (value) {
                    return '';
                  },
                  onChanged: onChanged,
                )
              ],
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                S.current.cancel,
                style: ptBodyLargeThin(context),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              onPressed: onSave,
              child: Text(
                S.current.save,
                style: ptBodyLargeThin(context),
              ),
            ),
          ],
        ),
      );
    },
  );
}
