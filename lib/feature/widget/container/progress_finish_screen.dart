import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

class ProgressFinishScreen extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String content;
  final String icon;
  final String buttonText;

  const ProgressFinishScreen(
      {super.key,
      required this.onTap,
      required this.title,
      required this.content,
      required this.icon,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sz.i.s8),
              child: const BuildBackButton(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            icon,
                            width: Sz.i.s88,
                            height: Sz.i.s88,
                          ),
                          const SpacingBox(h: 32),
                          Text(
                            title,
                            style: ptTitle4(context).copyWith(
                                fontSize: Sz.i.s24,
                                height: 1.3333,
                                color: getColor(context).white),
                            textAlign: TextAlign.center,
                          ),
                          const SpacingBox(h: 16),
                          Text(
                            content,
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                height: 1.7143,
                                color: getColor(context).white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    AppExpandButton.primary(
                        onTap: onTap,
                        forceUppercase: false,
                        label: buttonText,
                        enabled: true),
                    const SpacingBox(h: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
