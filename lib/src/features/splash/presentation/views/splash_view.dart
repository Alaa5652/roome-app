import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roome/src/config/router/routes.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2500), () => _goToNext());
  }

  void _goToNext() {
    Helper.uId = getIt.get<CacheHelper>().getIntData(key: AppStrings.uId);
    bool? onBoarding =
        getIt.get<CacheHelper>().getBoolData(key: AppStrings.onboarding);

    if (onBoarding != null) {
      if (Helper.uId != null) {
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
      } else {
        context.navigateAndReplacement(newRoute: Routes.loginViewRoute);
      }
    } else {
      context.navigateAndReplacement(newRoute: Routes.onBoardingViewRoute);
    }
  }

  void _setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final double bottomPadding = View.of(context).viewPadding.bottom;

    // Set the color based on the presence of the system navigation bar
    final Color? systemNavigationBarColor =
        bottomPadding > 0 ? null : Colors.transparent;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
