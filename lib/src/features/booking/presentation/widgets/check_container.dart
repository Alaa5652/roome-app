import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Container(
          height: 46.h,
          padding: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            color: state.brightness == Brightness.light
                ? AppColors.primaryColor.withOpacity(0.04)
                : AppColors.white60,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  hint,
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.black.withOpacity(0.6),
                  size: 18.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
