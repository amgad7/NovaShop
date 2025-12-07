import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/account/widgets/account_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/service_locator.dart';
import '../auth/cubit/auth_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          const HeightSpace(20),
          AccountItemWidget(
            iconPath: AppAssets.box,
            title: "My Orders",
            onTap: () {},
          ),
          const Divider(
            thickness: 8,
            color: Color(0xffE6E6E6),
          ),
          AccountItemWidget(
            iconPath: AppAssets.details,
            title: "My Details",
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(
            iconPath: AppAssets.address,
            title: "Address Book",
            onTap: () {
              context.pushNamed(AppRoutes.addressScreen);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(
            iconPath: AppAssets.question,
            title: "FAQ",
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(
            iconPath: AppAssets.help,
            title: "Help Center",
            onTap: () {},
          ),
          const HeightSpace(16),
          Divider(
            thickness: 8,
            color: Color(0xffE6E6E6),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: InkWell(
              onTap: () {
                showDialoge(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                    size: 25.sp,
                  ),
                  const WidthSpace(8),
                  Text(
                    "Logout",
                    style: AppStyles.black15BoldStyle
                        .copyWith(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ),
          const HeightSpace(20),
        ],
      ),
    );
  }
  showDialoge(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeightSpace(20),
                  Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.redAccent,
                    size: 50.sp,
                  ),
                  const HeightSpace(20),
                  Text(
                    "logout?",
                    style: AppStyles.black15BoldStyle,
                  ),
                  const HeightSpace(10),
                  Text("Are you sure you want to logout?",
                      style: AppStyles.grey12MediumStyle),
                  const HeightSpace(10),
                  PrimayButtonWidget(
                    buttonText: "yes logout",
                    buttonColor: Colors.redAccent,
                    height: 54.h,
                    width: 293.w,
                    onPress: () {
                      parentContext.read<AuthCubit>().logout();

                      parentContext.pushNamed(AppRoutes.loginScreen);
                    },
                  ),
                  const HeightSpace(10),
                  PrimayButtonWidget(
                    buttonText: "cancel",
                    height: 54.h,
                    width: 293.w,
                    buttonColor: Colors.grey,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const HeightSpace(20),
                ],
              ),
            ));
      },
    );
  }
}
