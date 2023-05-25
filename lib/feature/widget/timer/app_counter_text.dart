import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/nofication.dart';
import 'package:pine_app/feature/widget/timer/timer_count_down.dart';
import 'package:pine_app/generated/l10n.dart';

import 'timer_controller.dart';

class AppCounterText extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;
  const AppCounterText({
    super.key,
    required this.seconds,
    required this.onResend,
  });

  @override
  State<AppCounterText> createState() => _AppCounterTextState();
}

class _AppCounterTextState extends State<AppCounterText> {
  final CountdownController _controller = CountdownController(autoStart: true);
  final _isFinish = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    initToast(context);
    return ValueListenableBuilder(
      valueListenable: _isFinish,
      builder: (BuildContext context, bool isFinish, _) => isFinish
          ? InkWell(
              child: Text(S.current.resendOTP + ' ',
                  style: ptBodyLargeThin(context).copyWith(
                      color: getColor(context).white,
                      height: 1.7142,
                      fontSize: Sz.i.s14)),
              onTap: () {
                _isFinish.value = false;
                _controller.restart();
                widget.onResend();
              },
            )
          : Countdown(
              controller: _controller,
              seconds: widget.seconds,
              build: (_, double time) => Row(
                children: [
                  GestureDetector(
                    child: Text(S.current.resendOTP + ' ',
                        style: ptBodyLargeThin(context).copyWith(
                            color: getColor(context).white,
                            height: 1.7142,
                            fontSize: Sz.i.s14)),
                    onTap: () {
                      if (!_isFinish.value) {
                        showToastMessage(S.current
                            .pleaseWaitSeconds(formatHHMMSS(time.toInt())));
                      } else {
                        _isFinish.value = false;
                        _controller.restart();
                        widget.onResend();
                      }
                    },
                  ),
                  Text(
                    '(${formatHHMMSS(time.toInt())})',
                    style: pt17SFProText(context).copyWith(
                      color: getColor(context).white,
                      fontSize: Sz.i.s14,
                      height: 1.7142,
                    ),
                  ),
                ],
              ),
              interval: const Duration(milliseconds: 100),
              onFinished: () => _isFinish.value = true,
            ),
    );
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
