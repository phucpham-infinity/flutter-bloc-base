import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/fonts/fonts.dart';
import 'package:pine_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './colors.dart';

const List<LocalizationsDelegate> localization = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

/// Use this method to get all colors
AppColor getColor(context) => AppTheme.colors(context);

/// The default theme configuration IOS.
CupertinoThemeData defaultThemeIOS = const CupertinoThemeData(
    brightness: Brightness.light,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(fontFamily: Fonts.inter),
    ));

/// The default theme configuration Android.
ThemeData defaultThemeAndroid =
    ThemeData(brightness: Brightness.light, fontFamily: Fonts.inter);

class AppColor {
  Color black;
  Color white;

// primary
  Color primaryLight;
  Color primaryLightHover;
  Color primaryLightActive;
  Color primaryNormal;
  Color primaryNormalHover;
  Color primaryNormalActive;
  Color dark;
  Color darkHover;
  Color darkActive;
  Color darker;
  Color disabled;
  Color disabledLight;

// white
  Color whiteHover;
  Color whiteActive;
  Color light;
  Color lightHover;
  Color lightActive;
  Color normal;
  Color normalHover;
  Color normalActive;
  Color normalDark;
  Color whiteBackground;
  Color whiteF6;

  Color offWhite;

// black
  Color blackColor;
  Color offBlack;

  Color neutralBlack;
//
  Color textSecondDary;
  Color textPrimary;
  Color greyIcon;

// orange
  Color orangeDark50;
  Color orangeDark100;
  Color orangeDark300;

// green
  Color success50;
  Color success75;
  Color success100;
  Color success200;
  Color success300;
  Color success400;
  Color success500;
  Color success700;
  Color greenTextHistory;
  Color greenText;
  Color green3;

// yellow
  Color warning50;
  Color warning75;
  Color warning100;
  Color warning200;
  Color warning300;
  Color warning400;
  Color warning500;
  Color warning700;

// error
  Color error25;
  Color error50;
  Color error75;
  Color error100;
  Color error200;
  Color error300;
  Color error400;
  Color error500;

// grey
  Color grey;
  Color darkGrey;
  Color lightGrey;
  Color grey200;
  Color grey300;
  Color grey600;
  Color grey700;
  Color grey900;
  Color grey500;
  Color neutralGrey;
  Color neutralGrey4;
  Color neutral100;
  Color backgroundGrey;
  Color greyScale50;
  Color greyScale400;
  Color greyScale900;
  Color gray1;
  Color gray3;
  Color iconGray;

  // red
  Color red25;

  // blue
  Color blue600;
  Color blue;

  //text
  Color textGrey;
  Color textGrey2;
  Color textActive;
  Color textSecondary;

  //divider
  Color lightDivider;

  // stroke
  Color lightStroke;
  Color backgroundDarken;

  // border
  Color borderItemHistory;

  Color coralPeach;

  Color disableText;

  Color disableBg;

  Color accent1Primary;

  Color fontColor1;

  Color tertiary;

  Color userAccent;
  Color accent;
  Color accentLinks;

  Color primary400;
  Color primary600;

  // linear gradient
  Color linearGradientColor;
  Color linearGradientColor2;

  factory AppColor.createDarkThemColor() {
    return AppColor(
        orangeDark50: AppColors.orangeDark50,
        orangeDark100: AppColors.orangeDark100,
        orangeDark300: AppColors.orangeDark300,
        textSecondDary: AppColors.textSecondDary,
        greyIcon: AppColors.greyIcon,
        blackColor: AppColors.blackColor,
        black: AppColors.black,
        neutralBlack: AppColors.neutralBlack,
        white: AppColors.white,
        primaryLight: AppColors.primaryLight,
        primaryLightHover: AppColors.primaryLightHover,
        primaryLightActive: AppColors.primaryLightActive,
        primaryNormal: AppColors.primaryNormal,
        primaryNormalHover: AppColors.primaryNormalHover,
        primaryNormalActive: AppColors.primaryNormalActive,
        dark: AppColors.dark,
        darkHover: AppColors.darkHover,
        darkActive: AppColors.darkActive,
        darker: AppColors.darker,
        disabled: AppColors.disabled,
        disabledLight: AppColors.disabledLight,
        whiteHover: AppColors.whiteHover,
        whiteActive: AppColors.whiteActive,
        whiteBackground: AppColors.whiteBackground,
        light: AppColors.light,
        lightHover: AppColors.lightHover,
        lightActive: AppColors.lightActive,
        normal: AppColors.normal,
        normalHover: AppColors.normalHover,
        normalActive: AppColors.normalActive,
        normalDark: AppColors.normalDark,
        whiteF6: AppColors.whiteF6,
        success50: AppColors.success50,
        success75: AppColors.success75,
        success100: AppColors.success100,
        success200: AppColors.success200,
        success300: AppColors.success300,
        success400: AppColors.success400,
        success500: AppColors.success500,
        greenText: AppColors.greenText,
        success700: AppColors.success700,
        green3: AppColors.green3,
        warning50: AppColors.warning50,
        warning75: AppColors.warning75,
        warning100: AppColors.warning100,
        warning200: AppColors.warning200,
        warning300: AppColors.warning300,
        warning400: AppColors.warning400,
        warning500: AppColors.warning500,
        warning700: AppColors.warning700,
        error25: AppColors.error25,
        error50: AppColors.error50,
        error75: AppColors.error75,
        error100: AppColors.error100,
        error200: AppColors.error200,
        error300: AppColors.error300,
        error400: AppColors.error400,
        error500: AppColors.error500,
        grey: AppColors.grey,
        darkGrey: AppColors.darkGrey,
        lightGrey: AppColors.lightGrey,
        grey200: AppColors.grey200,
        grey300: AppColors.grey300,
        grey600: AppColors.grey600,
        grey700: AppColors.grey700,
        grey900: AppColors.grey900,
        grey500: AppColors.grey500,
        gray1: AppColors.gray1,
        gray3: AppColors.gray3,
        iconGray: AppColors.iconGray,
        neutralGrey: AppColors.neutralGrey,
        neutralGrey4: AppColors.neutralGrey4,
        neutral100: AppColors.neutral100,
        backgroundGrey: AppColors.backgroundGrey,
        greyScale50: AppColors.greyScale50,
        greyScale400: AppColors.greyScale400,
        greyScale900: AppColors.greyScale900,
        red25: AppColors.red25,
        blue: AppColors.blue,
        blue600: AppColors.blue600,
        lightDivider: AppColors.lightDivider,
        lightStroke: AppColors.lightStroke,
        backgroundDarken: AppColors.backgroundDarken,
        borderItemHistory: AppColors.borderItemHistory,
        coralPeach: AppColors.coralPeach,
        offWhite: AppColors.offWhite,
        offBlack: AppColors.offBlack,
        greenTextHistory: AppColors.greenTextHistory,
        textGrey: AppColors.textGrey,
        textGrey2: AppColors.textGrey2,
        textPrimary: AppColors.textPrimary,
        textActive: AppColors.textActive,
        disableText: AppColors.disableText,
        textSecondary: AppColors.textSecondary,
        disableBg: AppColors.disableBg,
        accent1Primary: AppColors.accent1Primary,
        fontColor1: AppColors.fontColor1,
        tertiary: AppColors.tertiary,
        userAccent: AppColors.userAccent,
        accent: AppColors.accent,
        accentLinks: AppColors.accentLinks,
        primary400: AppColors.primary400,
        primary600: AppColors.primary600,
        linearGradientColor: AppColors.linearGradientColor,
        linearGradientColor2: AppColors.linearGradientColor2);
  }

  factory AppColor.createLightThemColor() {
    return AppColor(
      orangeDark50: AppColors.orangeDark50,
      orangeDark100: AppColors.orangeDark100,
      orangeDark300: AppColors.orangeDark300,
      textGrey: AppColors.textGrey,
      textGrey2: AppColors.textGrey2,
      textActive: AppColors.textActive,
      textSecondDary: AppColors.textSecondDary,
      textSecondary: AppColors.textSecondary,
      textPrimary: AppColors.textPrimary,
      greyIcon: AppColors.greyIcon,
      blackColor: AppColors.blackColor,
      black: AppColors.black,
      offBlack: AppColors.offBlack,
      neutralBlack: AppColors.neutralBlack,
      white: AppColors.white,
      primaryLight: AppColors.primaryLight,
      primaryLightHover: AppColors.primaryLightHover,
      primaryLightActive: AppColors.primaryLightActive,
      primaryNormal: AppColors.primaryNormal,
      primaryNormalHover: AppColors.primaryNormalHover,
      primaryNormalActive: AppColors.primaryNormalActive,
      dark: AppColors.dark,
      darkHover: AppColors.darkHover,
      darkActive: AppColors.darkActive,
      darker: AppColors.darker,
      disabled: AppColors.disabled,
      disabledLight: AppColors.disabledLight,
      whiteHover: AppColors.whiteHover,
      whiteActive: AppColors.whiteActive,
      light: AppColors.light,
      lightHover: AppColors.lightHover,
      lightActive: AppColors.lightActive,
      whiteBackground: AppColors.whiteBackground,
      normal: AppColors.normal,
      normalHover: AppColors.normalHover,
      normalActive: AppColors.normalActive,
      normalDark: AppColors.normalDark,
      whiteF6: AppColors.whiteF6,
      offWhite: AppColors.offWhite,
      success50: AppColors.success50,
      success75: AppColors.success75,
      success100: AppColors.success100,
      success200: AppColors.success200,
      success300: AppColors.success300,
      success400: AppColors.success400,
      success500: AppColors.success500,
      success700: AppColors.success700,
      greenTextHistory: AppColors.greenTextHistory,
      greenText: AppColors.greenText,
      green3: AppColors.green3,
      warning50: AppColors.warning50,
      warning75: AppColors.warning75,
      warning100: AppColors.warning100,
      warning200: AppColors.warning200,
      warning300: AppColors.warning300,
      warning400: AppColors.warning400,
      warning500: AppColors.warning500,
      warning700: AppColors.warning700,
      error25: AppColors.error25,
      error50: AppColors.error50,
      error75: AppColors.error75,
      error100: AppColors.error100,
      error200: AppColors.error200,
      error300: AppColors.error300,
      error400: AppColors.error400,
      error500: AppColors.error500,
      grey: AppColors.grey,
      darkGrey: AppColors.darkGrey,
      lightGrey: AppColors.lightGrey,
      grey200: AppColors.grey200,
      grey300: AppColors.grey300,
      grey600: AppColors.grey600,
      grey700: AppColors.grey700,
      grey900: AppColors.grey900,
      grey500: AppColors.grey500,
      gray1: AppColors.gray1,
      gray3: AppColors.gray3,
      iconGray: AppColors.iconGray,
      neutralGrey: AppColors.neutralGrey,
      neutralGrey4: AppColors.neutralGrey4,
      neutral100: AppColors.neutral100,
      backgroundGrey: AppColors.backgroundGrey,
      greyScale50: AppColors.greyScale50,
      greyScale400: AppColors.greyScale400,
      greyScale900: AppColors.greyScale900,
      red25: AppColors.red25,
      blue: AppColors.blue,
      blue600: AppColors.blue600,
      lightDivider: AppColors.lightDivider,
      lightStroke: AppColors.lightStroke,
      backgroundDarken: AppColors.backgroundDarken,
      borderItemHistory: AppColors.borderItemHistory,
      coralPeach: AppColors.coralPeach,
      disableText: AppColors.disableText,
      disableBg: AppColors.disableBg,
      accent1Primary: AppColors.accent1Primary,
      fontColor1: AppColors.fontColor1,
      tertiary: AppColors.tertiary,
      userAccent: AppColors.userAccent,
      accent: AppColors.accent,
      accentLinks: AppColors.accentLinks,
      primary400: AppColors.primary400,
      primary600: AppColors.primary600,
      linearGradientColor: AppColors.linearGradientColor,
      linearGradientColor2: AppColors.linearGradientColor2,
    );
  }

  AppColor({
    required this.textGrey,
    required this.textActive,
    required this.textGrey2,
    required this.textSecondDary,
    required this.textSecondary,
    required this.textPrimary,
    required this.greyIcon,
    required this.whiteF6,
    required this.offWhite,
    required this.grey200,
    required this.grey300,
    required this.grey600,
    required this.grey700,
    required this.grey900,
    required this.gray1,
    required this.gray3,
    required this.iconGray,
    required this.backgroundGrey,
    required this.greyScale50,
    required this.greyScale400,
    required this.greyScale900,
    required this.blackColor,
    required this.black,
    required this.offBlack,
    required this.white,
    required this.primaryLight,
    required this.primaryLightHover,
    required this.primaryLightActive,
    required this.primaryNormal,
    required this.primaryNormalHover,
    required this.primaryNormalActive,
    required this.dark,
    required this.darkHover,
    required this.darkActive,
    required this.darker,
    required this.disabled,
    required this.disabledLight,
    required this.orangeDark50,
    required this.orangeDark100,
    required this.orangeDark300,
    required this.whiteBackground,
    required this.whiteHover,
    required this.whiteActive,
    required this.light,
    required this.lightHover,
    required this.lightActive,
    required this.normal,
    required this.normalHover,
    required this.normalActive,
    required this.normalDark,
    required this.success50,
    required this.success75,
    required this.success100,
    required this.success200,
    required this.success300,
    required this.success400,
    required this.success500,
    required this.success700,
    required this.greenTextHistory,
    required this.greenText,
    required this.green3,
    required this.warning50,
    required this.warning75,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.warning500,
    required this.warning700,
    required this.error25,
    required this.error50,
    required this.error75,
    required this.error100,
    required this.error200,
    required this.error300,
    required this.error400,
    required this.error500,
    required this.grey,
    required this.darkGrey,
    required this.lightGrey,
    required this.red25,
    required this.blue,
    required this.blue600,
    required this.lightDivider,
    required this.lightStroke,
    required this.backgroundDarken,
    required this.borderItemHistory,
    required this.coralPeach,
    required this.neutralGrey4,
    required this.neutral100,
    required this.neutralBlack,
    required this.neutralGrey,
    required this.grey500,
    required this.disableText,
    required this.disableBg,
    required this.accent1Primary,
    required this.fontColor1,
    required this.tertiary,
    required this.userAccent,
    required this.accent,
    required this.accentLinks,
    required this.primary400,
    required this.primary600,
    required this.linearGradientColor,
    required this.linearGradientColor2,
  });
}

class AppTheme {
  static final _darkTheme = AppColor.createDarkThemColor();
  static final _lightTheme = AppColor.createLightThemColor();

  static AppColor colors(BuildContext context) =>
      CupertinoTheme.of(context).brightness == Brightness.dark
          ? _darkTheme
          : _lightTheme;
}
