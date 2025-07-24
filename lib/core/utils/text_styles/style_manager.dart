import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'font_manager.dart';

class AppTextStyles {
  // DM Sans Medium, size 14
  static TextStyle dmSansMedium14({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.medium,
    fontSize: FontSize.s14,
    color: color,
    height: k2V,

  );

  // DM Sans Medium, size 12
  static TextStyle dmSansMedium12({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.medium,
    fontSize: FontSize.s12,
    color: color,
    height: k2V,

  ); // DM Sans Medium, size 10
  static TextStyle dmSansMedium10({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.medium,
    fontSize: FontSize.s12,
    color: color,
    height: k2V,

  );

  // DM Sans Bold, size 12
  static TextStyle dmSansBold12({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s12,
    color: color,
    height: k2V,

  );
  // DM Sans Bold, size 14
  static TextStyle dmSansBold14({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s14,
    color: color,
    height: k2V,

  ); // DM Sans Bold, size 16
  static TextStyle dmSansBold16({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s16,
    color: color,
    height: k2V,

  );// DM Sans Bold, size 20
  static TextStyle dmSansBold20({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.dmSans,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s20,
    color: color,
    height: k2V,

  );

  // Rubik Medium, size 28
  static TextStyle rubikMedium28({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.rubik,
    fontWeight: FontWeightManager.medium,
    fontSize: FontSize.s28,
    color: color,
    height: k2V,

  );

  // Rubik Regular, size 14
  static TextStyle rubikRegular14({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.rubik,
    fontWeight: FontWeightManager.regular,
    fontSize: FontSize.s14,
    color: color,
    height: k2V,

  );

  // Rubik Medium, size 18
  static TextStyle rubikMedium18({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.rubik,
    fontWeight: FontWeightManager.medium,
    fontSize: FontSize.s18,
    color: color,
    height: k2V,

  );
  // Rubik bold, size 30
  static TextStyle rubikBold30({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.rubik,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s30,
    color: color,
    height: k2V,

  );

  // Mulish Light, size 14
  static TextStyle mulishLight14({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.mulish,
    fontWeight: FontWeightManager.light,
    fontSize: FontSize.s14,
    color: color,
    height: k2V,

  );

  // Poppins regular, size 12
  static TextStyle poppinsRegular12({Color color = kBlackColor}) => TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeightManager.regular,
    fontSize: FontSize.s12,
    color: color,
    height: k2V,

  );
}
