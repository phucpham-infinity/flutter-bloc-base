import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/generated/l10n.dart';

class CuarCodeHero extends StatefulWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  const CuarCodeHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  @override
  State<CuarCodeHero> createState() => _CuarCodeHeroState();
}

class _CuarCodeHeroState extends State<CuarCodeHero> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
            child: Hero(
              tag: 'imageHero',
              child: Image.asset(
                widget.photo,
                width: widget.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          AppExpandButton.primary(
            onTap: widget.onTap,
            label: S.current.openFullScreen,
            textColor: getColor(context).accent,
            forceUppercase: false,
            enabled: true,
            backgroundTransparent: true,
          )
        ],
      ),
    );
  }
}
