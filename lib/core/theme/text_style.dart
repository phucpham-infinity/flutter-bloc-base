import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/fonts/fonts.dart';
import 'package:pine_app/core/theme/size.dart';

TextStyle ptTitle4(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).black,
    fontSize: Sz.i.s30,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4);

TextStyle ptTitle3(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).black,
    fontSize: Sz.i.s25,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.3);

TextStyle ptTitle2(context) => GoogleFonts.inter(
      color: AppTheme.colors(context).black,
      fontSize: Sz.i.s20,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.2,
    );

TextStyle ptTitle1(context) => GoogleFonts.inter(
    // fontFamily: Fonts.aktivGrotesk,
    color: AppTheme.colors(context).black,
    fontSize: Sz.i.s16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w600);
//Montserrat
TextStyle ptButton(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).black,
    fontSize: Sz.i.s16,
    fontWeight: FontWeight.w600);

TextStyle ptLink(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).black, fontSize: Sz.i.s15);

TextStyle ptBodyLarge(context) => GoogleFonts.inter(
      // fontFamily: Fonts.aktivGrotesk,
      color: AppTheme.colors(context).black,
      fontSize: Sz.i.s14,
      letterSpacing: 0.3,
    );

TextStyle pt20Navigo(context) => TextStyle(
    fontFamily: Fonts.navigoMedium,
    color: getColor(context).white,
    fontSize: Sz.i.s20,
    height: 1.4,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w500);

TextStyle pt17SFProText(context) => TextStyle(
      fontFamily: Fonts.sFProTextRegular,
      color: getColor(context).white,
      fontSize: Sz.i.s17,
      height: 1.4118,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
    );

TextStyle ptBodyLargeThin(context) => GoogleFonts.inter(
      color: AppTheme.colors(context).black,
      fontSize: Sz.i.s14,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w400,
    );

TextStyle pt12Poppins(context) => GoogleFonts.poppins(
      color: AppTheme.colors(context).white,
      fontSize: Sz.i.s12,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w400,
    );

TextStyle pt32Poppins(context) => GoogleFonts.poppins(
      color: AppTheme.colors(context).white,
      fontSize: Sz.i.s32,
      letterSpacing: 0.3,
      height: 1.5,
      fontWeight: FontWeight.w600,
    );

TextStyle ptBodyLargeBold(context) => GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      color: AppTheme.colors(context).white,
      fontSize: Sz.i.s14,
      letterSpacing: 0.3,
    );

TextStyle ptBodySemiBold(context) => GoogleFonts.inter(
      color: AppTheme.colors(context).black,
      fontSize: Sz.i.s14,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w500,
    );

TextStyle ptBody(context) => GoogleFonts.inter(
      color: AppTheme.colors(context).black,
      fontSize: Sz.i.s13,
      letterSpacing: 0.1,
    );

TextStyle ptSmall(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).darkGrey, fontSize: Sz.i.s12);

TextStyle ptTiny(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).darkGrey, fontSize: Sz.i.s11);

TextStyle ptTitleList(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).darkGrey,
    fontWeight: FontWeight.w600,
    fontSize: Sz.i.s17,
    letterSpacing: -0.41);

TextStyle ptSubtitleList(context) => GoogleFonts.inter(
    color: AppTheme.colors(context).darkGrey,
    fontWeight: FontWeight.w600,
    fontSize: Sz.i.s13,
    letterSpacing: -0.08);
