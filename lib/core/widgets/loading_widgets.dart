import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../styling/app_assets.dart';

class LoadingWidgets extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingWidgets({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: Center(
          child: LottieBuilder.asset(
        AppAssets.lottie,
        width: 200.w,
        height: 200.h,
      )),
    );
  }
}
