import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/colors.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../core/base/local_storage.dart';
import '../../core/theme/size.dart';
import '../../generated/l10n.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    requestNotificationPermissions();
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      whenBilling = true;
      whenPayingBills = true;
      whenChangingLoginSettings = true;
      whenExceedingLimits = true;

      byEmail = true;
      bySms = true;
      byPush = true;
      onChanged();
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 65,
          leading: const BackButton(),
          elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacingBox(h: 10),
              Text(
                S.current.notificationPreferences,
                style: ptButton(context).copyWith(
                    fontSize: Sz.i.s24, color: getColor(context).white),
              ),
              const SpacingBox(h: 42),
              Text(
                S.current.receiveNotificationsFor,
                style: ptButton(context).copyWith(
                    fontSize: Sz.i.s20, color: getColor(context).white),
              ),
              const SpacingBox(h: 42),
              _buildItem(
                onChanged: (value) {
                  whenBilling = value;
                  LocalStorage.instance
                      .writeBool(LocalStorage.WHEN_BILLING, value);
                  checkAlert();
                  onChanged();
                },
                value: whenBilling,
                title: S.current.paymentsAndTransfers,
              ),
              const SpacingBox(h: 26),
              _buildItem(
                onChanged: (value) {
                  whenPayingBills = value;
                  LocalStorage.instance
                      .writeBool(LocalStorage.WHEN_PAYING, value);
                  checkAlert();
                  onChanged();
                },
                value: whenPayingBills,
                title: S.current.deposits,
              ),
              const SpacingBox(h: 26),
              _buildItem(
                onChanged: (value) {
                  whenChangingLoginSettings = value;
                  LocalStorage.instance
                      .writeBool(LocalStorage.WHEN_CHANGING, value);
                  checkAlert();
                  onChanged();
                },
                value: whenChangingLoginSettings,
                title: S.current.outstandingInvoices,
              ),
              const SpacingBox(h: 26),
              _buildItem(
                onChanged: (value) {
                  whenExceedingLimits = value;
                  LocalStorage.instance
                      .writeBool(LocalStorage.WHEN_EXCEEDING, value);
                  checkAlert();
                  onChanged();
                },
                value: whenExceedingLimits,
                title: S.current.exceedingSetLimits,
              ),
              const SpacingBox(h: 42),
              Text(
                S.current.notificationMethods,
                style: ptButton(context).copyWith(
                    fontSize: Sz.i.s20, color: getColor(context).white),
              ),
              const SpacingBox(h: 42),
              _buildItem(
                onChanged: (value) {
                  byEmail = value;
                  LocalStorage.instance.writeBool(LocalStorage.BY_EMAIL, value);
                  onChanged();
                },
                value: byEmail,
                title: S.current.pushNotification,
              ),
              const SpacingBox(h: 26),
              _buildItem(
                onChanged: (value) {
                  bySms = value;
                  LocalStorage.instance.writeBool(LocalStorage.BY_SMS, value);
                  onChanged();
                },
                value: bySms,
                title: S.current.textMessage,
              ),
              const SpacingBox(h: 26),
              _buildItem(
                onChanged: (value) {
                  byPush = value;
                  LocalStorage.instance.writeBool(LocalStorage.BY_PUSH, value);
                  onChanged();
                },
                value: byPush,
                title: S.current.email,
              ),
              const SpacingBox(h: 26),
            ],
          ),
        ),
      ),
    );
  }

  void checkAlert() {
    if (!whenBilling &&
        !whenPayingBills &&
        !whenChangingLoginSettings &&
        !whenExceedingLimits) {
      byEmail = false;
      bySms = false;
      byPush = false;
    }
  }

  bool whenBilling = false;
  bool whenPayingBills = false;
  bool whenChangingLoginSettings = false;
  bool whenExceedingLimits = false;

  bool byEmail = false;
  bool bySms = false;
  bool byPush = false;
  void onChanged() {
    setState(() {});
  }

  Widget _buildItem(
      {required bool value,
      required Function(bool value) onChanged,
      required String title}) {
    return Row(
      children: [
        Text(
          title,
          style: ptBodyLargeThin(context)
              .copyWith(fontSize: Sz.i.s17, color: getColor(context).white),
        ),
        const Spacer(),
        CupertinoSwitch(
            value: value,
            trackColor: Colors.black.withOpacity(0.15),
            activeColor: AppColors.primaryLightActive,
            onChanged: onChanged),
      ],
    );
  }
}
