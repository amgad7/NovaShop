import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/features/account/account_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/cart_screen.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/utils/service_locator.dart';
import '../cart/cubit/cart_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  late final List<Widget> screens;
  @override
  void initState() {
    screens = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<ProductCubit>()..getProducts(),
          ),
          BlocProvider(
            create: (context) => sl<CategoriesCubit>()..categories(),
          ),
        ],
        child: HomeScreen(),
      ),
      CartScreen(),
      BlocProvider(
  create: (context) => sl<AuthCubit>(),
  child: AccountScreen(),
),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 1,
        selectedItemColor: AppColors.primaryColor,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
          if (value == 1) {
            context.read<CartCubit>().getCart("1");
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.sp,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30.sp,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3_outlined,
                size: 30.sp,
              ),
              label: "Account"),
        ],
      ),
    );
  }
}
