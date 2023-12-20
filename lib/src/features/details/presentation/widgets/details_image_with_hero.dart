import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/core/widgets/custom_error_icon.dart';
import 'package:roome/src/features/details/presentation/widgets/arrow_back_and_love_icon.dart';
import 'package:roome/src/features/details/presentation/widgets/more_images.dart';

class DetailsImageWithHero extends StatelessWidget {
  const DetailsImageWithHero({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Hero(
            tag: hotel.id!,
            child: CachedNetworkImage(
              imageUrl: hotel.images![0].path!,
              height: 400.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const CustomErrorIcon(),
            ),
          ),
        ),
        ArrowBackAndLoveIcon(hotel: hotel),
        MoreImages(hotel: hotel),
      ],
    );
  }
}
