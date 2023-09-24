import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/widgets/custom_snack_bar.dart';

import '../utils/app_colors.dart';

class Helper {
  static String? uId;

  static UnderlineInputBorder buildUnderlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 0.75.w,
      ),
    );
  }

  static void validatingPasswordField({
    required BuildContext context,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Password can't be blank!",
      );
    } else if (value.length < 8) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Too short password!",
      );
    }
  }

  static void validatingEmailField({
    required BuildContext context,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Email can't be blank!",
      );
    } else if (!value.contains('@')) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Incorrect Email!",
      );
    }
  }

  static void validatingNameField({
    required BuildContext context,
    String? value,
  }) {
    if (value!.isEmpty) {
      CustomSnackBar.show(
        context: context,
        title: "Something went wrong",
        message: "Username can't be blank!",
      );
    }
  }
}
