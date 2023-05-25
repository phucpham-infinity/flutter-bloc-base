import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

var scale = Device.get().isTablet ? 1.6 : 1.0;
double keyboardHeightValue = 0.0;

double devicePaddingTop(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top;
double devicePaddingBottom(BuildContext context) =>
    MediaQuery.of(context).viewPadding.bottom;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double keyboardHeight(BuildContext context) {
  keyboardHeightValue = MediaQuery.of(context).viewInsets.bottom;
  return keyboardHeightValue;
}

double setDeviceScale(BuildContext context) {
  final size = MediaQuery.of(context).size;
  double phoneScale = size.height / 820 > 1 ? 1 : size.height / 820;

  // For normal devices.
  scale = Device.get().isTablet ? 1.5 : phoneScale;

  return 1;
}

bool isKeyboardOpen(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 0;
}

class Sz {
  Sz._privateConstructor();
  static final Sz i = Sz._privateConstructor();

  double s1 = 1 * scale;
  double s1c5 = 1.5 * scale;
  double s2 = 2 * scale;
  double s3 = 3 * scale;
  double s4 = 4 * scale;
  double s4c5 = 4.5 * scale;
  double s5 = 5 * scale;
  double s6 = 6 * scale;
  double s7 = 7 * scale;
  double s8 = 8 * scale;
  double s8c5 = 8.5 * scale;
  double s9 = 9 * scale;
  double s9c5 = 9.5 * scale;
  double s10 = 10 * scale;
  double s11 = 11 * scale;
  double s12 = 12 * scale;
  double s12c5 = 12.5 * scale;
  double s13 = 13 * scale;
  double s14 = 14 * scale;
  double s15 = 15 * scale;
  double s16 = 16 * scale;
  double s17 = 17 * scale;
  double s18 = 18 * scale;
  double s19 = 19 * scale;
  double s20 = 20 * scale;
  double s21 = 21 * scale;
  double s21c5 = 21.5 * scale;
  double s22 = 22 * scale;
  double s23 = 23 * scale;
  double s24 = 24 * scale;
  double s25 = 25 * scale;
  double s26 = 26 * scale;
  double s27 = 27 * scale;
  double s28 = 28 * scale;
  double s29 = 29 * scale;
  double s30 = 30 * scale;
  double s31 = 31 * scale;
  double s32 = 32 * scale;
  double s33 = 33 * scale;
  double s34 = 34 * scale;
  double s35 = 35 * scale;
  double s36 = 36 * scale;
  double s37 = 37 * scale;
  double s38 = 38 * scale;
  double s39 = 39 * scale;
  double s40 = 40 * scale;
  double s41 = 41 * scale;
  double s42 = 42 * scale;
  double s43 = 43 * scale;
  double s44 = 44 * scale;
  double s45 = 45 * scale;
  double s46 = 46 * scale;
  double s47 = 47 * scale;
  double s48 = 48 * scale;
  double s49 = 49 * scale;
  double s50 = 50 * scale;
  double s51 = 51 * scale;
  double s52 = 52 * scale;
  double s53 = 53 * scale;
  double s54 = 54 * scale;
  double s55 = 55 * scale;
  double s56 = 56 * scale;
  double s57 = 57 * scale;
  double s58 = 58 * scale;
  double s59 = 59 * scale;
  double s60 = 60 * scale;
  double s62 = 62 * scale;
  double s64 = 64 * scale;
  double s65 = 65 * scale;
  double s68 = 68 * scale;
  double s70 = 70 * scale;
  double s72 = 72 * scale;
  double s74 = 74 * scale;
  double s75 = 75 * scale;
  double s76 = 76 * scale;
  double s79 = 79 * scale;
  double s80 = 80 * scale;
  double s81 = 81 * scale;
  double s82 = 82 * scale;
  double s84 = 84 * scale;
  double s85 = 85 * scale;
  double s86 = 86 * scale;
  double s88 = 88 * scale;
  double s90 = 90 * scale;
  double s91 = 91 * scale;
  double s92 = 92 * scale;
  double s94 = 94 * scale;
  double s95 = 95 * scale;
  double s96 = 96 * scale;
  double s98 = 98 * scale;
  double s100 = 100 * scale;
  double s102 = 102 * scale;
  double s108 = 108 * scale;
  double s109 = 109 * scale;
  double s110 = 110 * scale;
  double s111 = 111 * scale;
  double s113 = 113 * scale;
  double s114 = 114 * scale;
  double s116 = 116 * scale;
  double s120 = 120 * scale;
  double s123 = 123 * scale;
  double s125 = 125 * scale;
  double s126 = 126 * scale;
  double s130 = 130 * scale;
  double s134 = 134 * scale;
  double s135 = 135 * scale;
  double s140 = 140 * scale;
  double s141 = 141 * scale;
  double s142 = 142 * scale;
  double s145 = 145 * scale;
  double s148 = 148 * scale;
  double s151 = 151 * scale;
  double s152 = 152 * scale;
  double s153 = 153 * scale;
  double s158 = 158 * scale;
  double s160 = 160 * scale;
  double s168 = 168 * scale;
  double s171 = 171 * scale;
  double s176 = 176 * scale;

  double s177 = 177 * scale;
  double s180 = 180 * scale;
  double s186 = 186 * scale;
  double s185 = 185 * scale;
  double s188 = 188 * scale;
  double s192 = 192 * scale;
  double s196 = 196 * scale;
  double s197 = 197 * scale;
  double s200 = 200 * scale;
  double s211 = 211 * scale;
  double s212 = 212 * scale;
  double s213 = 213 * scale;
  double s217 = 217 * scale;
  double s220 = 220 * scale;
  double s224 = 224 * scale;
  double s225 = 225 * scale;
  double s231 = 231 * scale;

  double s235 = 235 * scale;

  double s240 = 240 * scale;
  double s242 = 242 * scale;
  double s254 = 254 * scale;
  double s260 = 260 * scale;
  double s265 = 265 * scale;
  double s270 = 270 * scale;
  double s275 = 275 * scale;
  double s280 = 280 * scale;
  double s288 = 288 * scale;

  double s299 = 299 * scale;
  double s300 = 300 * scale;
  double s320 = 320 * scale;
  double s347 = 347 * scale;
  double s377 = 377 * scale;
  double s387 = 387 * scale;
  double s390 = 390 * scale;
  double s462 = 462 * scale;
  double s474 = 474 * scale;
  double s561 = 561 * scale;
}
