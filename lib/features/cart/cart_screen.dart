import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/widget/cart_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/title_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final isLoading = state is CartLoading;

          return Skeletonizer(
            enabled: isLoading,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(20),
                    if (state is CartLoaded)
                      ...state.cartsModel.products!
                          .map((product) => CartItemWidget(product: product))
                          .toList()
                    else
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _buildSkeletonCartItem(),
                        ),
                      ),
                    const HeightSpace(20),
                    TitlePriceWidget(
                      title: "Sub Total",
                      price: state is CartLoaded ? "1190 \$" : "---- \$",
                    ),
                    TitlePriceWidget(
                      title: "VAT (16 %)",
                      price: state is CartLoaded ? "1190 \$" : "--- \$",
                    ),
                    TitlePriceWidget(
                      title: "Shipping Fees",
                      price: state is CartLoaded ? "1190 \$" : "-- \$",
                    ),
                    const HeightSpace(20),
                    const Divider(),
                    const HeightSpace(20),
                    TotalPriceWidget(
                      title: "Total",
                      price: state is CartLoaded ? "1190 \$" : "---- \$",
                    ),
                    const HeightSpace(20),
                    PrimayButtonWidget(
                      buttonText: "Go To Checkout",
                      trailingIcon: Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      onPress: isLoading ? null : () {},
                    ),
                    const HeightSpace(20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeletonCartItem() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          WidthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                const HeightSpace(8),
                Container(
                  width: 100.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                const HeightSpace(8),
                Row(
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    WidthSpace(12),
                    Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    WidthSpace(12),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
