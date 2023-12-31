import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHotelCard extends StatelessWidget {
  const ShimmerHotelCard({
    super.key,
    this.cardHeight,
    this.cardWidth,
  });

  final double? cardHeight;
  final double? cardWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: state.brightness == Brightness.light
              ? AppColors.shimmerBaseColor
              : AppColors.darkShimmerBaseColor,
          highlightColor: state.brightness == Brightness.light
              ? AppColors.shimmerHighlightColor
              : AppColors.darkShimmerHighlightColor,
          enabled: true,
          child: Container(
            height: cardHeight?.h,
            width: cardWidth?.w,
            decoration: BoxDecoration(
              color: AppColors.shimmerContainerColor,
              borderRadius: BorderRadius.all(Radius.circular(13.r)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 1.73.h),
                  blurRadius: 10.h,
                  color: AppColors.shadowColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
