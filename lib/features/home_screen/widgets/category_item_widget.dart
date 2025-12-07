import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final VoidCallback? onTap;
  const CategoryItemWidget(
      {super.key,
      required this.categoryName,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            border: isSelected ? null : Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(categoryName,
              style: AppStyles.black15BoldStyle.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              )),
        ),
      ),
    );
  }
}
