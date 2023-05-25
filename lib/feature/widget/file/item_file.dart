import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/enum/file_type.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/string_utils.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';

class BuildItemFile extends StatelessWidget {
  final File file;
  final String size;
  final String fileUpload;
  final void Function()? onRemove;
  const BuildItemFile(
      {super.key,
      required this.file,
      required this.size,
      required this.fileUpload,
      this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sz.i.s24,
        vertical: Sz.i.s16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: Sz.i.s12, vertical: Sz.i.s6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Sz.i.s10,
              ),
              color: const Color(0xff385984),
            ),
            child: SvgPicture.asset(getMimeTypeFromPath(file.path).getIcon()),
          ),
          const SpacingBox(w: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.getShortString(30),
                  style: ptBodyLargeThin(context).copyWith(
                      fontSize: Sz.i.s17,
                      height: 1.4118,
                      color: getColor(context).white),
                ),
                Text(
                  size.toString(),
                  style: ptBodyLargeThin(context).copyWith(
                      fontSize: Sz.i.s12,
                      color: getColor(context).textSecondary),
                ),
              ],
            ),
          ),
          const SpacingBox(w: 16),
          GestureDetector(
            onTap: onRemove,
            child: SvgPicture.asset(
              AppIcons.closeCircle,
              width: Sz.i.s22,
              height: Sz.i.s22,
            ),
          )
        ],
      ),
    );
  }
}
