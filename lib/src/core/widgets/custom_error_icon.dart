import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class CustomErrorIcon extends StatelessWidget {
  const CustomErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Icon(
      Icons.error,
      size: 22.h,
      color: AppColors.primaryColor,
    );
  }
}
