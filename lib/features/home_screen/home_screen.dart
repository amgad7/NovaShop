import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/routing/router_generation_config.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/loading_widgets.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_screen/models/ProductsModel.dart';
import 'package:ecommerce_app/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/product_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/title_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/service_locator.dart';
import 'cubit/categories_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCat = "All";
  @override
  void initState() {
    // context.read<ProductCubit>().getProducts();
    // context.read<CategoriesCubit>().categories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(50),
          SizedBox(
            width: 335.w,
            child: Text(
              "Discover",
              style: AppStyles.primaryHeadLinesStyle,
            ),
          ),
          const HeightSpace(16),
          Row(
            children: [
              CustomTextField(
                width: 270.w,
                hintText: "Search For Clothes",
              ),
              const WidthSpace(8),
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const HeightSpace(16),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccess) {
                return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.categories.map(
                        (cat) {
                          return CategoryItemWidget(
                            categoryName: cat,
                            isSelected: selectedCat == cat ? true : false,
                            onTap: () {
                              setState(() {
                                selectedCat = cat;
                              });
                              if (cat == "All") {
                                context.read<ProductCubit>().getProducts();
                              } else {
                                context
                                    .read<ProductCubit>()
                                    .getProductsCategories(cat);
                              }
                            },
                          );
                        },
                      ).toList(),
                    ));
              }
              return SizedBox.shrink();
            },
          ),
          const HeightSpace(5),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.sp,
                        crossAxisSpacing: 16.sp,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 150.w,
                          height: 120.h,
                          color: Colors.green,
                        );
                      },
                      itemCount: 8,
                    ),
                  ),
                );
              }
              if (state is ProductSuccess) {
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onRefresh: () async {
                      selectedCat = "All";
                      setState(() {});
                      context.read<ProductCubit>().getProducts();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          ProductsModel product = state.products[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: ProductItemWidget(
                                  title: product.title!,
                                  price: product.price.toString(),
                                  image: product.image!,
                                  onTap: () {
                                    context.pushNamed(AppRoutes.productScreen,
                                        extra: product);
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: state.products.length,
                      ),
                    ),
                  ),
                );
              }
              return Text("there is an error");
            },
          )
        ],
      ),
    );
  }
}
