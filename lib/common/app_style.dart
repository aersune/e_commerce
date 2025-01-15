
import 'package:flutter/material.dart';

import 'package:e_commerce/common/app_colors.dart';

class AppStyle {
  static TextStyle h1 = TextStyle(fontSize: 35, fontWeight: FontWeight.w600);
  static TextStyle h2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.titleColor);
  static TextStyle priceStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.titleColor);
  static TextStyle normal = TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.blackColor.withOpacity(.4));
}