import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/booking/data/models/booking_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_one_form_numbers.dart';
import 'package:roome/src/features/booking/presentation/widgets/booking_two_form.dart';

class BookingTwoView extends StatelessWidget {
  const BookingTwoView({super.key, required this.bookingInfo});

  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AppConstants.physics,
          slivers: [
            const CustomSliverAppBar(
              titleText: 'Booking Form',
              centerTitle: true,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInRight(
                      from: AppConstants.fadeInHorizontalValue,
                      child: const BookingOneFormNumbers(isBookingOne: false),
                    ),
                    SizedBox(height: 46.h),
                    BookingTwoForm(bookingInfo: bookingInfo),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
