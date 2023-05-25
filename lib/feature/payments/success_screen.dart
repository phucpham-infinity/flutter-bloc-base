import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/icons/icons.dart';
import '../../core/theme/size.dart';
import '../../core/theme/text_style.dart';
import '../../generated/l10n.dart';
import '../widget/button/app_expand_button.dart';
import '../widget/container/spacing_box.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: Column(
        children: [
          SafeArea(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Sz.i.s8),
                    child: BackButton(color: Colors.white),
                  ))),
          const Spacer(),
          SvgPicture.asset(AppIcons.icSuccess),
          const SpacingBox(h: 32),
          Text(
            S.current.successfully,
            style: ptButton(context)
                .copyWith(fontSize: Sz.i.s24, color: getColor(context).white),
          ),
          const SpacingBox(h: 16),
          Text(
            S.current.theBillForWasPaid('500'),
            textAlign: TextAlign.center,
            style: ptBodyLargeThin(context)
                .copyWith(fontSize: Sz.i.s14, color: getColor(context).white),
          ),
          const SpacingBox(h: 24),
          Container(
              margin: EdgeInsets.symmetric(horizontal: Sz.i.s24),
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s32, vertical: Sz.i.s16),
              decoration: BoxDecoration(
                  color: const Color(0xffC3CFC5),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                S.current.theTransferWillBeCompleted,
                style: ptBodyLargeThin(context)
                    .copyWith(fontSize: Sz.i.s14, height: 1.7143),
              )),
          const SpacingBox(h: 24),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
            child: AppExpandButton.primary(
              forceUppercase: false,
              onTap: () async {},
              label: S.current.share,
              enabled: true,
            ),
          ),
          const SpacingBox(h: 29),
        ],
      ),
    );
  }
}
