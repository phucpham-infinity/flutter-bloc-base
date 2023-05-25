import 'package:flutter/material.dart';

import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class FullScrennCuarCode extends StatelessWidget {
  const FullScrennCuarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: getColor(context).white,
          padding: EdgeInsets.symmetric(vertical: Sz.i.s151).copyWith(
            left: Sz.i.s58,
            right: Sz.i.s75,
          ),
          child: Row(
            children: [
              RotatedBox(
                  quarterTurns: 1,
                  child: AppExpandButton.primary(
                    onTap: () {
                      Get.back();
                    },
                    label: S.current.close,
                    forceUppercase: false,
                    enabled: true,
                    backgroundTransparent: true,
                    textColor: getColor(context).accent,
                  )),
              const Spacer(),
              Hero(
                tag: 'imageHero',
                child: Image.asset(
                  Images.cuarcodeVertical,
                  width: Sz.i.s90,
                  height: Sz.i.s462,
                ),
              ),
              const Spacer(),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  S.current.showTheCourierTheCuarcode,
                  style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s14,
                    height: 1.7143,
                    color: getColor(context).gray3,
                  ),
                ),
              ),
              const SpacingBox(w: 8),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  S.current.deliveryDocuments,
                  style: ptBodyLargeBold(context).copyWith(
                    fontSize: Sz.i.s16,
                    color: getColor(context).black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
