import 'package:fluttertoast/fluttertoast.dart';
import 'package:pine_app/core/env/env.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/colors.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

final FToast toast = FToast();

void initToast(BuildContext context) {
  toast.init(context);
}

void showNotification(String message) {
  if (message.isEmpty) return;
  toast.removeCustomToast();
  toast.showToast(
    positionedToastBuilder: (context, child) => GestureDetector(
      onTap: () {
        toast.removeCustomToast();
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: Sz.i.s16,
                right: Sz.i.s16,
              ),
              child: child,
            ),
          ),
        ],
      ),
    ),
    child: NotificationMessage(message: message),
    toastDuration: const Duration(seconds: 6),
  );
}

/// Show a toast message
void showToastMessage(
  String message, {
  ToastMessageType type = ToastMessageType.success,
  ToastGravity? gravity = ToastGravity.BOTTOM,
  Duration? toastDuration,
  Color? backgroundColor,
  String? action,
  void Function()? actionTap,
}) {
  toast.removeCustomToast();

  toast.showToast(
    child: ToastMessage(
      message: message,
      type: type,
      backgroundColor: backgroundColor,
      action: action,
      actionTap: actionTap,
    ),
    toastDuration: toastDuration ?? const Duration(seconds: 3),
    gravity: gravity,
  );
}

/// Show a toast message
void showToastErrorMessage(String? message,
    {ToastGravity? gravity = ToastGravity.TOP,
    Duration? toastDuration,
    String? copyErrorTrack,
    Color? backgroundColor}) {
  try {
    toast.removeCustomToast();
  } catch (e) {}

  if (dev && copyErrorTrack != null) {
    Clipboard.setData(ClipboardData(text: copyErrorTrack));
  }

  toast.showToast(
    child: ToastMessage(
      message: message ?? S.current.error,
      type: ToastMessageType.failure,
      backgroundColor: backgroundColor ?? AppColors.warning700,
    ),
    toastDuration: toastDuration ?? const Duration(seconds: 4),
    gravity: gravity,
  );
}

/// `Hide current toast message`
void hideToast() {
  toast.removeCustomToast();
}

class NotificationMessage extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final String? action;
  final void Function()? actionTap;

  const NotificationMessage(
      {Key? key,
      this.message = '',
      this.backgroundColor,
      this.action,
      this.actionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sz.i.s13),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Sz.i.s100 * 4),
        child: FrostedContainer(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Sz.i.s6),
                  child: SizedBox(
                    width: Sz.i.s40,
                    height: Sz.i.s40,
                    child: Image.asset(AppIcons.appLogo),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Snac_flutter',
                            style: ptBodyLargeBold(context),
                          ),
                          const Spacer(),
                          Text(
                            S.current.justNow,
                            style: ptBody(context).copyWith(
                              color: AppColors.grey,
                            ),
                          )
                        ],
                      ),
                      const SpacingBox(h: 3),
                      Text(
                        message,
                        style: ptBody(context),
                      ),
                    ],
                  ),
                ),
                if (action != null)
                  GestureDetector(
                    onTap: actionTap,
                    child: Padding(
                      padding: EdgeInsets.only(right: Sz.i.s5),
                      child: Text(
                        action!,
                        style: ptBody(context).copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ToastMessage extends StatelessWidget {
  final ToastMessageType type;
  final String message;
  final Color? backgroundColor;
  final String? action;
  final void Function()? actionTap;

  const ToastMessage(
      {Key? key,
      this.type = ToastMessageType.success,
      this.message = '',
      this.backgroundColor,
      this.action,
      this.actionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? bgColor = backgroundColor;
    // If background color is not passed, set background color base on
    // notification type (success, failure)
    bgColor ??= type == ToastMessageType.success
        ? Colors.grey.withOpacity(0.5)
        : Colors.grey.withOpacity(0.5);
    final IconData icon = type == ToastMessageType.success
        ? Icons.check_circle_outline_rounded
        : Icons.block_rounded;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: getColor(context).black,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              message,
              style: ptBody(context),
            ),
          ),
          if (action != null)
            GestureDetector(
              onTap: actionTap,
              child: Padding(
                padding: EdgeInsets.only(right: Sz.i.s5),
                child: Text(
                  action!,
                  style: ptBody(context).copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

enum ToastMessageType { success, failure }
