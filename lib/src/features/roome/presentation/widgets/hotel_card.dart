import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/widgets/love_icon.dart';

import 'package:roome/src/core/widgets/star_icon.dart';
import 'package:roome/src/core/widgets/location_text.dart';
import 'package:roome/src/core/models/using_hero_model.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_error_icon.dart';

import '../../../../core/widgets/price_per_night_text.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.hotel,
  });

  final Hotel hotel;
  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.detailsViewRoute,
        arguments: UsingHeroModel(hotel: hotel, usingHero: true),
      ),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13.r)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.73.w),
              blurRadius: 10.w,
              color: AppColors.shadowColor,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18.r)),
                    child: Hero(
                      tag: hotel.id!,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${EndPoints.imageBaseUrl}${hotel.images![0].path}',
                        height: 89.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const CustomErrorIcon(),
                      ),
                    ),
                  ),
                ),
                LoveIcon(hotel: hotel),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, right: 10.w, left: 10.w),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      hotel.name!,
                      style: AppTextStyles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  const StarIcon(),
                  SizedBox(width: 3.w),
                  Text(
                    hotel.rate!.toString(),
                    style: AppTextStyles.bottomNavTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 7.h),
              child: LocationText(location: hotel.location!),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w, top: 7.h),
              child: PricePerNightText(price: hotel.price!),
            ),
          ],
        ),
      ),
    );
  }
}
