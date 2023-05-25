import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class BuildUploadScanButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const BuildUploadScanButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sz.i.s10, horizontal: Sz.i.s24),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: deviceWidth(context),
          child: DottedBorder(
            color: getColor(context).white.withOpacity(0.7),
            strokeWidth: Sz.i.s2,
            borderType: BorderType.RRect,
            dashPattern: [Sz.i.s20, Sz.i.s10],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Sz.i.s24),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.paperClipAttechment,
                        height: Sz.i.s36,
                        width: Sz.i.s36,
                      ),
                      const SpacingBox(h: 10),
                      Text(
                        text,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s16,
                        ),
                      ),
                      const SpacingBox(h: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                        child: Text(
                          S.current.youCanUpload,
                          style: ptBodyLargeThin(context).copyWith(
                            fontSize: Sz.i.s14,
                            color: getColor(context).white.withOpacity(0.5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
