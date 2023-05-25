import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';

class BuildTitleWithSub extends StatelessWidget {
  final String title;
  final String sub;
  final double? size;
  const BuildTitleWithSub({
    super.key,
    required this.title,
    required this.sub,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ptTitle4(context).copyWith(
              color: getColor(context).white,
              fontSize: size ?? Sz.i.s24,
            ),
          ),
          const SpacingBox(h: 16),
          Text(
            sub,
            style: ptBodyLargeThin(context).copyWith(
                color: getColor(context).white,
                fontSize: Sz.i.s17,
                height: 1.4118),
          ),
        ],
      ),
    );
  }
}
