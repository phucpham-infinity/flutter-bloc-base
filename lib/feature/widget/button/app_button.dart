import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/size.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppIconButtonPosition {
  start,
  end,
  none,
}

extension ExtensionOnButtonStyle on ButtonStyle {
  ButtonStyle get anyHeight => copyWith(
        maximumSize: const MaterialStatePropertyAll(Size.infinite),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
      );

  ButtonStyle fixHeight(double height) => copyWith(
        maximumSize: MaterialStatePropertyAll(Size(double.infinity, height)),
        minimumSize: MaterialStatePropertyAll(Size(0, height)),
      );

  ButtonStyle get zeroPadding =>
      copyWith(padding: const MaterialStatePropertyAll(EdgeInsets.zero));
}

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget label;
  final ButtonStyle? style;
  final bool? enabled;
  final double? elevation;
  final EdgeInsets? padding;
  final double? heightItem;
  final double? radius;
  final double? widthButton;

  const AppButton({
    required this.onTap,
    required this.label,
    this.enabled,
    this.elevation,
    this.style,
    this.padding,
    this.heightItem,
    this.radius,
    this.widthButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: (enabled == false) ? null : onTap,
      style: style?.copyWith(
          maximumSize: MaterialStateProperty.all(
              Size(widthButton ?? width, heightItem ?? Sz.i.s56)),
          minimumSize: MaterialStateProperty.all(
              Size(widthButton ?? width, heightItem ?? Sz.i.s56)),
          elevation: MaterialStatePropertyAll(elevation ?? 0),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) =>
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 16))),
          padding: padding != null
              ? MaterialStatePropertyAll(padding)
              : Theme.of(context).textButtonTheme.style?.padding),
      child: label,
    );
  }

  factory AppButton.primary({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool forceUppercase = true,
    int? maxLines,
    double? elevation,
    Color? textColor,
    ButtonStyle? buttonStyle,
    bool backgroundTransparent = false,
    double widthButton = double.infinity,
  }) =>
      AppButton(
        onTap: onTap,
        enabled: enabled,
        elevation: elevation,
        widthButton: widthButton,
        label: Text(
          forceUppercase ? label.toUpperCase() : label,
          maxLines: maxLines ?? 1,
          style: textStylePrimary.copyWith(
            color: textColor ??
                AppColors.white.withOpacity(enabled ?? false ? 1 : 0.2),
          ),
        ),
        style: buttonStyle != null && enabled == true
            ? primaryStyle
            : buttonStyle ??
                primaryStyle
                    .copyWith(
                      backgroundColor: backgroundTransparent
                          ? MaterialStateProperty.all(Colors.transparent)
                          : null,
                    )
                    .anyHeight,
      );

  factory AppButton.secondary({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool forceUppercase = true,
    int? maxLines,
  }) =>
      AppButton(
        onTap: onTap,
        label: Text(
          label,
          maxLines: maxLines ?? 1,
          style: textStyleSecondary.copyWith(
            color: AppColors.black.withOpacity(enabled ?? false ? 1 : 0.5),
          ),
        ),
        style: secondaryStyle,
        enabled: enabled,
      );

  factory AppButton.abort({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool forceUppercase = true,
    int? maxLines,
    double? elevation,
  }) =>
      AppButton(
        onTap: onTap,
        enabled: enabled,
        elevation: elevation,
        label: Text(
          forceUppercase ? label.toUpperCase() : label,
          maxLines: maxLines ?? 1,
        ),
        style: abortStyle,
      );

  factory AppButton.discreet({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool forceUppercase = true,
    int? maxLines,
    Color? textColor,
    TextStyle? textStyle,
  }) =>
      AppButton(
        onTap: onTap,
        label: Text(forceUppercase ? label.toUpperCase() : label,
            maxLines: maxLines ?? 1),
        style: discreetStyle(textColor: textColor, textStyle: textStyle),
        enabled: enabled,
      );

  factory AppButton.icon(
          {required VoidCallback onTap,
          required Widget label,
          IconData? icon,
          Widget? wIcon,
          double iconSize = 24,
          double spaceBetween = 0,
          ButtonStyle? style,
          bool? enabled,
          Color? iconColor,
          EdgeInsets? padding,
          bool padIconSymmetrically = true,
          bool expand = true,
          AppIconButtonPosition? iconPosition,
          double? radius,
          double? heightItem}) =>
      AppButton(
          onTap: onTap,
          style: style,
          enabled: enabled,
          padding: padding,
          heightItem: heightItem,
          radius: radius,
          label: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (iconPosition == AppIconButtonPosition.start ||
                  iconPosition == null)
                wIcon ?? Icon(icon, size: iconSize, color: iconColor)
              else if (padIconSymmetrically)
                SizedBox(width: iconSize),
              if (iconPosition == AppIconButtonPosition.start ||
                  iconPosition == null)
                SizedBox(width: spaceBetween),
              expand ? Expanded(child: label) : label,
              if (iconPosition == AppIconButtonPosition.end)
                SizedBox(width: spaceBetween),
              if (iconPosition == AppIconButtonPosition.end)
                wIcon ?? Icon(icon, size: iconSize, color: iconColor)
              else if (padIconSymmetrically)
                SizedBox(width: iconSize),
            ],
          ));

  static TextStyle get textStylePrimary =>
      GoogleFonts.inter(fontSize: Sz.i.s16, fontWeight: FontWeight.w600);

  static TextStyle get textStyleSecondary =>
      TextStyle(fontSize: Sz.i.s16, fontWeight: FontWeight.bold);

  static ButtonStyle get primaryStyle => TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        backgroundColor: AppColors.primaryLightActive,
        disabledBackgroundColor: AppColors.primaryLightHover,
      );

  static ButtonStyle get secondaryStyle => TextButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        disabledBackgroundColor: AppColors.primaryLightHover,
      );

  static ButtonStyle discreetStyle(
          {double? borderRadius, Color? textColor, TextStyle? textStyle}) =>
      TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 99)),
          textStyle: textStyle,
          foregroundColor: textColor ?? Colors.white);

  static ButtonStyle get abortStyle => TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        backgroundColor: AppColors.abortColor,
        foregroundColor: AppColors.white,
      );

  static ButtonStyle get outlinedStyle => TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
            side: const BorderSide(color: AppColors.white)),
        disabledBackgroundColor: AppColors.primaryLightHover,
      );

  static ButtonStyle get outlinedStyleAccentSecondary => TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
            side: const BorderSide(color: AppColors.white)),
        textStyle: const TextStyle(color: AppColors.white),
        disabledBackgroundColor: AppColors.primaryLightHover,
      );
}
